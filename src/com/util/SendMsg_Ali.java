package com.util;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.BizResult;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

/**
 * <p>ClassName: SendMsg_webchinese</p>
 * <p>@Description: 阿里大鱼短信发送</p>
 * <p>@author BianMingZhou</p>
 * <p>@date 2016-6-13下午5:09:23</p>
 */
public class SendMsg_Ali {
	private static Logger logger = Logger.getLogger(SendMsg_Ali.class);
	/**
	 * @Title: sendMsg
	 * @Description: 阿里大鱼短信发送
	 * @author BianMingZhou
	 * @date 2015-12-22 下午6:12:38
	 * @param @param content
	 * @param @param phoneNumber
	 * @param @param type 模版类型 1用户注册验证码SMS_1950122 2快捷返利并创建用户SMS_3630352 3会员迁移注册SMS_4515089
	 *                    4已有用户快捷返利SMS_5049131 content为jsonString {"username":"","money":""}
	 *                    5后台密码重置SMS_7441211 6用户修改密码验证码SMS_5655099 7用户发起提现请求SMS_7760776
	 *                    8支付密码操作 （设置支付密码 或 修改支付密码）SMS_8700001
	 *                    9广告下架通知 SMS_9695982
	 * @param @return
	 * @param @throws Exception
	 * @return String -4号码不正确  >0发送短信数量 -1短信发送异常
	 * @throws
	 */
	public static String sendMsg(String content,String phoneNumber,int type)
			throws Exception {
		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest","23287683","7484ad6f3a3698acb79ef12cdc093277");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		//req.setExtend("");//公共回传参数，在“消息返回”中会透传回该参数；举例：用户可以传入自己下级的会员ID，在消息返回时，该会员ID会包含在内，用户可以根据该会员ID识别是哪位会员使用了你的应用
		req.setSmsType("normal");
		req.setRecNum(phoneNumber);
		if(content!=null&&!"".equals(content.trim())){
			if(type==1){
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"code\":\""+content+"\",\"product\":\"邻邻\"}");
				req.setSmsTemplateCode("SMS_1950122");
			}else if(type==2){
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"money\":\""+content+"\"}");
				req.setSmsTemplateCode("SMS_3630352");
			}else if(type==3){
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"phonenum\":\""+phoneNumber+"\",\"name\":\""+content+"\"}");
				req.setSmsTemplateCode("SMS_4515089");
			}else if(type==4){
				req.setSmsFreeSignName("成都圈圈儿科技");
				JSONObject json = JSONObject.fromObject(content);

				req.setSmsParamString("{\"username\":\""
						+ json.getString("username") + "\",\"money\":\""
						+ json.getString("money") + "\"}");

				req.setSmsTemplateCode("SMS_5049131");
			}else if(type==5){
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"username\":\""+content+"\"}");
				req.setSmsTemplateCode("SMS_7441211");
			}else if(type==6){
				req.setSmsFreeSignName("成都圈圈儿科技");
				JSONObject json = JSONObject.fromObject(content);

				req.setSmsParamString("{\"username\":\""
						+ json.getString("username") + "\",\"code\":\""
						+ json.getString("code") + "\"}");
				req.setSmsTemplateCode("SMS_5655099");
			}else if(type==7){
				req.setSmsFreeSignName("成都圈圈儿科技");
				JSONObject json = JSONObject.fromObject(content);

				req.setSmsParamString("{\"username\":\""
						+ json.getString("username") + "\",\"number\":\""
						+ json.getString("number") + "\"}");
				req.setSmsTemplateCode("SMS_7760776");
			}else if(type==8){
				req.setSmsFreeSignName("成都圈圈儿科技");
				JSONObject json = JSONObject.fromObject(content);

				req.setSmsParamString("{\"username\":\""
						+ json.getString("username") + "\",\"code\":\""
						+ json.getString("code") + "\"}");
				req.setSmsTemplateCode("SMS_8700001");
			}else if (type==9) {
				//广告商余额不足
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"username\":\""+content+"\"}");
				req.setSmsTemplateCode("SMS_9676438");
			}else if (type==10) {
				// 广告下架
				JSONObject json = JSONObject.fromObject(content);
				req.setSmsFreeSignName("成都圈圈儿科技");
				req.setSmsParamString("{\"username\":\""
						+ json.getString("username") + "\",\"reason\":\""
						+ json.getString("reason") + "\",\"advname\":\""
						+ json.getString("advname") + "\"}");
				req.setSmsTemplateCode("SMS_9661567");

			}
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);

			BizResult result=rsp.getResult();
			String bodystr=rsp.getBody();

			String responseStr=new String(bodystr.getBytes("gbk"));

			if(result!=null){
				if(result.getSuccess()){//成功
				   return "1";
				}else{
					logger.error(phoneNumber+"发送类型:"+type+"短信时，短信发送失败，短信返回："+responseStr);
					return "-1";
				}
			}else{
				//http://open.taobao.com/apitools/errorCodeSearch?spm=0.0.0.0.fNPfev   异常查询
				//短信发送异常
				JSONObject jo=JSONObject.fromObject(responseStr);
				JSONObject json=jo.getJSONObject("error_response");
				if(json.getInt("code")==15&&json.getString("sub_code").equalsIgnoreCase("isv.MOBILE_NUMBER_ILLEGAL")){
					logger.error(phoneNumber+"发送类型:"+type+"短信时，手机号"+phoneNumber+"格式不正确");
					return "-4";
				}
				//错误原因：触发业务流控限制
				//解决方案：短信验证码，使用同一个签名，对同一个手机号码发送短信验证码，允许每分钟1条，累计每小时7条。 短信通知，使用同一签名、同一模板，对同一手机号发送短信通知，允许每天50条（自然日）。
				    logger.error(phoneNumber+"发送类型:"+type+"短信时，短信发送异常，短信返回："+responseStr);
				    return "-1";
			}
		}else{
			logger.error(phoneNumber+"发送类型:"+type+"短信时，短信发送类容为null");
			return "-1";
		}
	}

	/**
	 * <p>Description : 阿里大鱼发送短信</p>
	 * <p>Author : XQL</p>
	 * <p>Date : 2016/5/23 17:58</p>
	 *
	 * @param content 短信内容JSONObject[对应短信模板的键值对]
	 * @param phone 发送短信手机号
	 * @param msgCode 短信模板ID
	 * @return String -4号码不正确  >0发送短信数量 -1短信发送异常
     * @throws Exception
     */
	public static String sendMsg(JSONObject content, String phone, String msgCode) throws Exception{

		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest","23287683","7484ad6f3a3698acb79ef12cdc093277");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		//req.setExtend("");//公共回传参数，在“消息返回”中会透传回该参数；举例：用户可以传入自己下级的会员ID，在消息返回时，该会员ID会包含在内，用户可以根据该会员ID识别是哪位会员使用了你的应用
		req.setSmsType("normal");
		req.setRecNum(phone);
		if(content != null && !StringUtils.isEmpty(content.toString())){
			req.setSmsFreeSignName("成都圈圈儿科技");
			req.setSmsParamString(content.toString());
			req.setSmsTemplateCode(msgCode);

			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);

			BizResult result = rsp.getResult();
			String bodystr = rsp.getBody();

			String responseStr = new String(bodystr.getBytes("gbk"));

			if(result != null){
				if(result.getSuccess()){//成功
					return "1";
				}else{
					logger.error(phone+"发送类型:"+msgCode+"短信时，短信发送失败，短信返回："+responseStr);
					return "-1";
				}
			}else{
				//http://open.taobao.com/apitools/errorCodeSearch?spm=0.0.0.0.fNPfev   异常查询
				//短信发送异常
				JSONObject jo=JSONObject.fromObject(responseStr);
				JSONObject json=jo.getJSONObject("error_response");
				if(json.getInt("code")==15&&json.getString("sub_code").equalsIgnoreCase("isv.MOBILE_NUMBER_ILLEGAL")){
					logger.error(phone+"发送类型:"+msgCode+"短信时，手机号"+phone+"格式不正确");
					return "-4";
				}
				//错误原因：触发业务流控限制
				//解决方案：短信验证码，使用同一个签名，对同一个手机号码发送短信验证码，允许每分钟1条，累计每小时7条。 短信通知，使用同一签名、同一模板，对同一手机号发送短信通知，允许每天50条（自然日）。
				logger.error(phone+"发送类型:"+msgCode+"短信时，短信发送异常，短信返回："+responseStr);
				return "-1";
			}
		}else{
			logger.error(phone+"发送类型:"+msgCode+"短信时，短信发送类容为null");
			return "-1";
		}
	}

/*	public static String sendMsg(String content, String phoneNumber)
			throws Exception {

		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "Cdquanquaner"),
				new NameValuePair("Key", "86b8b7ff4a9492589685"),
				new NameValuePair("smsMob", phoneNumber),
				new NameValuePair("smsText", content) };
		post.setRequestBody(data);


		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
		System.out.println(h.toString());
		}
		18281863522

		String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
		logger.info(result);
		//System.out.println(result); //打印返回消息状态

		post.releaseConnection();
		return result;
	}
*/

	public static void main(String[] args) {
		try {
			//String result = SendMsg_webchinese.sendMsg("123456","18328669168",1);
			JSONObject content = new JSONObject();
			content.put("code","半阙残月");
			content.put("product","1230000");
			String result = SendMsg_Ali.sendMsg(content,"18328669168","SMS_1950122");
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}