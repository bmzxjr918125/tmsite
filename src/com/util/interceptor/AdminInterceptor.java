package com.util.interceptor;

import com.entity.Admin;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;

/**
 * 后台管理登录拦截
 * @author  BianMingZhou
 *
 */
public class AdminInterceptor extends MethodFilterInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {

		HttpServletRequest request = (HttpServletRequest)invocation.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		//验证是否登录
		if (invocation.getInvocationContext().getSession().get("adminInfo") != null) {

			//非超级管理员
			Admin admin = (Admin) invocation.getInvocationContext().getSession().get("adminInfo");
			if(admin.getType() != 0){
				//验证是否有权限
				String url = request.getRequestURI();
				url = url.length() > 6 ? url.substring(6) : url;
				String allPower = (String) invocation.getInvocationContext().getSession().get("allPower");
				allPower = allPower == null ? "" : allPower;
				String myPower = (String) invocation.getInvocationContext().getSession().get("myPower");

				if(allPower.contains(url)){
					if(!myPower.contains(url)){
						return "noPower";
					}
				}
				return invocation.invoke();
			}
			return invocation.invoke();
		}
		return "Login";
	}

}
