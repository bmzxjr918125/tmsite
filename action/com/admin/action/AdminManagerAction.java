package com.admin.action;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.base.action.datatables.DataTables;
import com.entity.Admin;
import com.exception.BizException;
import com.opensymphony.xwork2.Action;
import com.service.AdminService;
import com.util.Md5Utils;
import com.util.RequestUtils;
import com.util.pojo.Answer;

@Controller("adminManagerAction")
@Scope("prototype")
public class AdminManagerAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = -2341442329946781239L;

	private Admin admin;
	
	private AdminService adminService;
	
	/**
	 * 
	 * <p>@Description: 登录页</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:06:12</p>
	 */
	public String Login(){
		
		return "Login";
	}
	
	/**
	 * 
	 * <p>@Description: 登入</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-19下午4:06:20</p>
	 */
	public String Loginin() {

		String username = RequestUtils.getStrParamter("username");
		String password = RequestUtils.getStrParamter("password");
		
		admin = adminService.getAdminByName(username);
		if (null == admin || "".equals(admin)) {
			
			request.getSession().setAttribute("message", "没有此用户信息,请重新输入");
			return Action.INPUT;
		}
		
		if (!password.equals(admin.getPassword())) {
			
			request.getSession().setAttribute("message", "密码错误");
			return Action.INPUT;
		}
		
		Date lastTime = admin.getThisLoginDate();
		Date newdate = new Date();
		
		admin.setLastLoginDate(lastTime);
		admin.setThisLoginDate(newdate);
		adminService.update(admin);
		
		if (request.getSession().getAttribute("adminInfo") != null) {
			
			request.getSession().removeAttribute("adminInfo");
		}
		
		request.getSession().setAttribute("adminInfo", admin);
		request.getSession().setAttribute("message", null);

		return "success";
	
	}
	
	/**
	 * 
	 * <p>@Description: 登出</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20上午9:52:42</p>
	 */
	public String Logout(){
		
		if (request.getSession().getAttribute("adminInfo") != null) {
			
			request.getSession().removeAttribute("adminInfo");
		}
		request.getSession().removeAttribute("message");
		request.getSession().invalidate();//手动使session失效
		
		return Action.INPUT;
	}
	
	/**
	 * 
	 * <p>@Description: 管理员</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20上午10:28:23</p>
	 */
	public String GetAdminList(){
		
		return "GetAdminList";
	}
	
	/**
	 * 
	 * <p>@Description: 管理员数据</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20上午10:28:36</p>
	 */
	public String AjaxGetAdminList(){
		
		String adminAccount = RequestUtils.getStrParamter("adminAccount");
		
		adminService.getAdminList(super.getDtJson(),adminAccount);
		
		DataTables data = super.getDtJson();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略 
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);//设置循环策略为忽略    解决json最头疼的问题 死循环
		jsonConfig.setExcludes(new String[]{"handler","hibernateLazyInitializer"});  
		super.getDtJson().setData(JSONArray.fromObject(data.getData(),jsonConfig));
		
		return "AjaxGetAdminList";
	}
	
	/**
	 * 
	 * <p>@Description: 新增管理员</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午2:50:46</p>
	 */
	public String SaveAdmin(){
		
		String admin_account = RequestUtils.getStrParamter("admin_account");
		int admin_type = RequestUtils.getIntParamter("admin_type");
		String admin_pwd = RequestUtils.getStrParamter("admin_pwd");
		admin_pwd = Md5Utils.md5(Md5Utils.md5(admin_pwd));
		
		Admin admin = new Admin();
		admin.setType(admin_type);
		admin.setStatus(1);
		admin.setUsername(admin_account);
		admin.setPassword(admin_pwd);
		admin.setCreatDate(new Date());
		admin.setUpdateDate(new Date());
		admin.setLastLoginDate(new Date());
		admin.setThisLoginDate(new Date());
		
		adminService.save(admin);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"保存成功");
		return super.ANSWER;
	}
	
	/**
	 * 
	 * <p>@Description: 注销管理员</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午3:11:53</p>
	 */
	public String CancellationAdmin(){
		
		int adminId = RequestUtils.getIntParamter("adminId");
		
		Admin admin = adminService.getById(adminId);
		if (null == admin) {
			
			throw new BizException("用户不存在");
		}
		
		adminService.deleteById(adminId);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	/**
	 * 
	 * <p>@Description: 冻结或者解冻管理员</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午3:08:32</p>
	 */
	public String FreezeAdmin(){
		
		int adminId = RequestUtils.getIntParamter("adminId");
		int status = RequestUtils.getIntParamter("status");
		Admin admin = adminService.getById(adminId);
		if (null == admin) {
			
			throw new BizException("用户不存在");
		}
		
		admin.setStatus(status);
		admin.setUpdateDate(new Date());
		adminService.update(admin);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	
	

	public AdminService getAdminService() {
		return adminService;
	}

	@Resource(name = "adminService")
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
}
