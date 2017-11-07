package com.admin.action;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.base.action.datatables.DataTables;
import com.entity.Admin;
import com.entity.Notice;
import com.exception.BizException;
import com.service.NoticeService;
import com.util.RequestUtils;
import com.util.pojo.Answer;

@Controller("adminNoticeAction")
@Scope("prototype")
public class AdminNoticeAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 4803483746305505499L;
	
	private JSONObject json;
	
	private NoticeService noticeService;

	/**
	 * 
	 * <p>@Description: 公告</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:34</p>
	 */
	public String Show(){
		
		return "Show";
	}
	
	/**
	 * 
	 * <p>@Description: 公告数据</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:43</p>
	 */
	public String AjaxShow(){
		
		String notice_title = RequestUtils.getStrParamter("notice_title");
		
		noticeService.getNoticeList(super.getDtJson(), 2, notice_title);
		
		DataTables data = super.getDtJson();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略 
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);//设置循环策略为忽略    解决json最头疼的问题 死循环
		jsonConfig.setExcludes(new String[]{"handler","hibernateLazyInitializer"});  
		super.getDtJson().setData(JSONArray.fromObject(data.getData(),jsonConfig));
		
		return "AjaxShow";
	}
	
	/**
	 * 
	 * <p>@Description: 添加公告</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:54:54</p>
	 */
	public String AddNotice(){
		
		return "AddNotice";
	}
	
	/**
	 * 
	 * <p>@Description: 保存公告</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午4:55:04</p>
	 */
	public String SaveNotice(){
		
		String title = RequestUtils.getStrParamter("notice_title");
		String content = RequestUtils.getStrParamter("notice_content");
		
		if (StringUtils.isEmpty(title)) {
			
			throw new BizException("请填写标题");
		}
		
		if (StringUtils.isEmpty(content)) {
			
			throw new BizException("请填写内容");
		}
		
		Admin admin = (Admin) request.getSession().getAttribute("adminInfo");
		if (null == admin) {
			
			throw new BizException("请重新登录");
		}
		
		Notice notice = new Notice();
		notice.setAdmin(admin);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setCreateDate(new Date());
		notice.setUpdateDate(new Date());
		notice.setStatus(1);
		notice.setType(2);
		
		noticeService.save(notice);
		
		return "SaveNotice";
	}

	/**
	 * 
	 * <p>@Description: 修改</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:17:44</p>
	 */
	public String UpdateNotice(){
		
		int noticeId = RequestUtils.getIntParamter("noticeId");
		
		Notice notice = noticeService.getById(noticeId);
		if (null == notice) {
			
			throw new BizException("公告不存在");
		}
		
		json = new JSONObject();
		
		json.put("notice", notice);
		
		return "UpdateNotice";
	}
	
	/**
	 * 
	 * <p>@Description: 修改后保存</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:20:19</p>
	 */
	public String UpdateSaveNotice(){
		
		int noticeId = RequestUtils.getIntParamter("noticeId");
		String title = RequestUtils.getStrParamter("notice_title");
		String content = RequestUtils.getStrParamter("notice_content");
		
		if (StringUtils.isEmpty(title)) {
			
			throw new BizException("请填写标题");
		}
		
		if (StringUtils.isEmpty(content)) {
			
			throw new BizException("请填写内容");
		}
		
		Admin admin = (Admin) request.getSession().getAttribute("adminInfo");
		if (null == admin) {
			
			throw new BizException("请重新登录");
		}
		
		Notice notice = noticeService.getById(noticeId);
		if (null == notice) {
			
			throw new BizException("公告不存在");
		}
		
		notice.setAdmin(admin);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setUpdateDate(new Date());
		
		noticeService.update(notice);
		
		return "UpdateSaveNotice";
	}
	
	/**
	 * 
	 * <p>@Description: 删除</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:44:23</p>
	 */
	public String DeleteNotice(){
		
		int noticeId = RequestUtils.getIntParamter("noticeId");
		
		Notice notice = noticeService.getById(noticeId);
		if (null == notice) {
			
			throw new BizException("公告不存在");
		}
		
		noticeService.deleteById(noticeId);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	/**
	 * 
	 * <p>@Description: 下架或者上架</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-20下午5:45:28</p>
	 */
	public String CloseNotice(){
		
		int noticeId = RequestUtils.getIntParamter("noticeId");
		int status = RequestUtils.getIntParamter("status");
		
		Notice notice = noticeService.getById(noticeId);
		if (null == notice) {
			
			throw new BizException("公告不存在");
		}
		
		notice.setStatus(status);
		noticeService.update(notice);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	
	
	public NoticeService getNoticeService() {
		return noticeService;
	}

	@Resource(name = "noticeService")
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}
	
}
