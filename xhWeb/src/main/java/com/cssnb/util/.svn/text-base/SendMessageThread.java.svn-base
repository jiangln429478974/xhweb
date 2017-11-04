package com.cssnb.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;

public class SendMessageThread extends Thread{

	Map map;

	public SendMessageThread(Map map) {
		this.map = map;
	}

	@SuppressWarnings({ "resource", "deprecation" })
	@Override
	public void run() {
		try {
			// TODO Auto-generated method stub
			Map<String, String> paramsMap = new HashMap<String, String>();
			HttpClient httpClient = new DefaultHttpClient();
			/**
			 * http://192.168.191.1:8080/xyxx/cx/smsSend?HTYHM=123&MMA=456&MSG=&
			 * JSNO=
			 */
			HttpPost httpPost = new HttpPost(
					"http://10.19.13.243/xyxx/cx/smsSend");
			// HttpPost httpPost=new
			// HttpPost("http://127.0.0.1:8080/xyxx/cx/smsSend");
			List<NameValuePair> params = null;

			if (params == null)
				params = new ArrayList<NameValuePair>();
			// System.out.println("uuidArr:"+uuidArr[i]+
			// "  mobileArr: "+mobileArr[i] + "  content: "+content);
			params.add(new BasicNameValuePair("HTYHM", "123"));
			params.add(new BasicNameValuePair("MMA", "456"));
			params.add(new BasicNameValuePair("MSG", map.get("CONTENT")
					.toString()));

			params.add(new BasicNameValuePair("JSNO", map.get("JSSJHM")
					.toString()));

			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params,
					"utf-8");
			httpPost.setEntity(entity);
			HttpResponse httpResponse = httpClient.execute(httpPost);
			String response = "";
			if (httpResponse.getStatusLine().getStatusCode() == 200) {
				HttpEntity entit1y = httpResponse.getEntity();// 调用getEntity()方法获取到一个HttpEntity实例
				response = EntityUtils.toString(entit1y, "utf-8");// 用EntityUtils.toString()这个静态方法将HttpEntity转换成字符串,防止服务器返回的数据带有中文,所以在转换的时候将字符集指定成utf-8就可以了
			}
			System.out.println(response);
			String msg = JSON.parseObject(response).getString("msg");
			System.out.println("发送结果------->" + msg);
			params = null;
		} catch (Exception e) {
		}
	}

	private boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("JSSJHM", "15058437662");
		map.put("CONTENT", "我是内容");
		SendMessageThread sm=new SendMessageThread(map);
		sm.start();
	}

}
