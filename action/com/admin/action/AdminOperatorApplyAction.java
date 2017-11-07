package com.admin.action;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.base.action.datatables.DataTables;
import com.entity.OperatorApply;
import com.exception.BizException;
import com.service.OperatorApplyService;
import com.util.RequestUtils;
import com.util.pojo.Answer;

@Controller("adminOperatorApplyAction")
@Scope("prototype")
public class AdminOperatorApplyAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = 5990059711654425115L;
	
	private OperatorApplyService operatorApplyService;
	
	/**
	 * 
	 * <p>@Description: 申请列表</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午5:07:52</p>
	 */
	public String Show(){
		
		return "Show";
	}
	
	/**
	 * 
	 * <p>@Description: 数据</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-21下午5:08:02</p>
	 */
	public String AjaxShow(){
		
		String phone = RequestUtils.getStrParamter("phone");
		
		operatorApplyService.getApplyList(super.getDtJson(), phone);
		
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
	 * <p>@Description: 删除</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午9:38:24</p>
	 */
	public String DeleteApply(){
		
		int applyId = RequestUtils.getIntParamter("applyId");
		
		OperatorApply apply = operatorApplyService.getById(applyId);
		if (null == apply) {
			
			throw new BizException("申请不存在");
		}
		
		operatorApplyService.deleteById(applyId);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	
	/**
	 * 
	 * <p>@Description: 处理申请</p>
	 * <p>@param @return</p>   
	 * <p>@return String</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午9:47:16</p>
	 */
	public String HandleApply(){
		
		int applyId = RequestUtils.getIntParamter("applyId");
		int status = RequestUtils.getIntParamter("status");
		
		OperatorApply apply = operatorApplyService.getById(applyId);
		if (null == apply) {
			
			throw new BizException("申请不存在");
		}
		
		apply.setStatus(status);
		operatorApplyService.update(apply);
		
		this.answer = new Answer(Answer.SUCCESS,Answer.SUCCESS_CODE,"操作成功");
		return super.ANSWER;
	}
	

	public OperatorApplyService getOperatorApplyService() {
		return operatorApplyService;
	}

	@Resource(name = "operatorApplyService")
	public void setOperatorApplyService(OperatorApplyService operatorApplyService) {
		this.operatorApplyService = operatorApplyService;
	}
	
}
