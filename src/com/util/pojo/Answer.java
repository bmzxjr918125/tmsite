package com.util.pojo;

import java.util.HashMap;

import net.sf.json.JSONObject;

/**
 * 扩展HashMap
 * 统一响应类
 */
@SuppressWarnings("serial")
public class Answer extends HashMap<String,Object> {
	
	
    public static final String
            SUCCESS = "success",
            EXCEPTION = "exception",
            ERROR = "error";
    public static final String
		    SUCCESS_CODE = "200",//请求成功
		    EXCEPTION_CODE = "500",//请求异常
		    LOGIN_TIMEOUT_CODE = "300",//请求时登录失效
		    ERROR_CODE = "404";//请求成功

    public Answer(){
        super();
    }
    public Answer(String response) {
        super();
        put("response",response);
    }

    public Answer(String response, String msg) {
        super();
        put("response",response);
        put("msg",msg);
    }
    public Answer(String response,String code,String msg) {
    	super();
    	put("response",response);
    	put("code",code);
    	put("msg",msg);
    }
	@SuppressWarnings("unchecked")
    public Answer(JSONObject json) {
	    super();
        putAll(json);
    }
    public Object getResponse() {
		return get("response");
	}
	public void setResponse(String response) {
		put("response",response);
	}
	public Object getCode() {
		return get("code");
	}
	public void setCode(String code) {
		put("code",code);
	}
	public Object getMsg() {
		return get("msg");
	}
	public void setMsg(String msg) {
		put("msg",msg);
	}
}
