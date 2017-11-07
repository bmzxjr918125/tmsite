package com.html.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.base.action.BaseAction;
import com.entity.OperatorApply;
import com.exception.BizException;
import com.service.OperatorApplyService;
import com.util.RequestUtils;
import com.util.pojo.Answer;

import net.sf.json.JSONObject;

@Controller("operatorApplyAction")
@Scope("prototype")
public class OperatorApplyAction extends BaseAction{

	/**
	 * <p>@Fields serialVersionUID : TODO</p>
	 */
	private static final long serialVersionUID = -5958179069413895488L;
	
	private JSONObject json;
	private OperatorApplyService operatorApplyService;

	/**
	 * 
	 * <p>@Description: 渠道申请</p>
	 * <p>@param @throws IOException</p>   
	 * <p>@return void</p> 
	 * <p>@throws</p>
	 * <p>@author TangTianBao</p>
	 * <p>@date 2016-10-24上午10:58:16</p>
	 */
	public String OperatorApply() throws IOException{
		
		
		json = new JSONObject();
		
		String apply_name = RequestUtils.getStrParamter("apply_name");
		String apply_phone = RequestUtils.getStrParamter("apply_phone");
		String apply_area = RequestUtils.getStrParamter("apply_area");
		
		if (StringUtils.isEmpty(apply_name)) {
			
			throw new BizException("申请人姓名不能为空");
		}
		
		if (StringUtils.isEmpty(apply_phone)) {
			
			throw new BizException("申请人联系方式不能为空");
		}

		if (StringUtils.isEmpty(apply_area)) {
		
			throw new BizException("申请区域不能为空");
		}
		
		OperatorApply apply = new OperatorApply();
		apply.setUsername(apply_name);
		apply.setPhone(apply_phone);
		apply.setArea(apply_area);
		apply.setCreateDate(new Date());
		apply.setStatus(0);
		
		operatorApplyService.save(apply);
		
		json.put("response", "success");
		
        this.answer=new Answer(json);
        
        return super.ANSWER; 
	}

	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public OperatorApplyService getOperatorApplyService() {
		return operatorApplyService;
	}

	@Resource(name = "operatorApplyService")
	public void setOperatorApplyService(OperatorApplyService operatorApplyService) {
		this.operatorApplyService = operatorApplyService;
	}
	
}
