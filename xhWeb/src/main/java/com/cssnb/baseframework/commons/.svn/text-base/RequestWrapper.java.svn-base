package com.cssnb.baseframework.commons;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.CleanResults;
import org.owasp.validator.html.Policy;
import org.owasp.validator.html.PolicyException;
import org.owasp.validator.html.ScanException;

public class RequestWrapper extends HttpServletRequestWrapper {

	private Map<String, String[]> params;

	public RequestWrapper(HttpServletRequest request,
			Map<String, String[]> newParams) {
		super(request);
		this.params = newParams;
	}

	@Override
	public String getParameter(String name) {
		String result = "";

		Object v = params.get(name);
		if (v == null) {
			result = null;
		} else if (v instanceof String[]) {
			String[] strArr = (String[]) v;
			if (strArr.length > 0) {
				result = strArr[0];
			} else {
				result = null;
			}
		} else if (v instanceof String) {
			result = (String) v;
			result = xssClean(result);
		} else {
			result = v.toString();
			result = xssClean(result);
		}
		
		
		/**
		 * 配置如果有特殊字符，则去掉整段值
		 * <param-value><![CDATA[ <,>,script,javascript,',delete,update,insert,select,onclick,alert,param,style,%]]></param-value>
		 */
		if(v != null&&(result.toLowerCase().indexOf(">")>-1||
				result.toLowerCase().indexOf("<")>-1||
				result.toLowerCase().indexOf("script")>-1||
				result.toLowerCase().indexOf("javascript")>-1||
				result.toLowerCase().indexOf("delete")>-1||
				result.toLowerCase().indexOf("'")>-1||
				result.toLowerCase().indexOf("update")>-1||
				result.toLowerCase().indexOf("insert")>-1||
				result.toLowerCase().indexOf("select")>-1||
				result.toLowerCase().indexOf("onclick")>-1||
				result.toLowerCase().indexOf("alert")>-1||
				result.toLowerCase().indexOf("param")>-1||
				result.toLowerCase().indexOf("style")>-1||
//				result.toLowerCase().indexOf("%")>-1||
				result.toLowerCase().indexOf("onclick")>-1||
				result.toLowerCase().indexOf("alert")>-1||
				result.toLowerCase().indexOf("#")>-1||
				result.toLowerCase().indexOf("textarea")>-1||
				result.toLowerCase().indexOf("post")>-1||
				result.toLowerCase().indexOf("cookie")>-1||
				result.toLowerCase().indexOf("document")>-1||
				result.toLowerCase().indexOf(">")>-1)){
			result="";
		}
		return result;
	}

	//清洗掉有问题的数据
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, String[]> getParameterMap() {
		Map<String, String[]> request_map = super.getParameterMap();
		Iterator iterator = request_map.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry me = (Map.Entry) iterator.next();
			System.out.println(me.getKey() + ":");
			String[] values = (String[]) me.getValue();
			for (int i = 0; i < values.length; i++) {
				System.out.println(values[i]);
				values[i] = xssClean(values[i]);
			}
		}
		return request_map;
	}

	// @Override
	// public Map getParameterMap() {
	// return params;
	// }

	@Override
	public Enumeration getParameterNames() {
		return new Vector(params.keySet()).elements();
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] result = null;

		Object v = params.get(name);
		if (v == null) {
			result = null;
		} else if (v instanceof String[]) {
			result = (String[]) v;
		} else if (v instanceof String) {
			result = new String[] { (String) v };
		} else {
			result = new String[] { v.toString() };
		}
 
		return result;
	}


	private String xssClean(String value) {
		AntiSamy antiSamy = new AntiSamy();
		try {
			Policy policy = Policy.getInstance(RequestWrapper.class
					.getResourceAsStream("antisamy-ebay.xml"));
			// CleanResults cr = antiSamy.scan(dirtyInput, policyFilePath);
			final CleanResults cr = antiSamy.scan(value, policy);
			// 安全的HTML输出
			return cr.getCleanHTML();
		} catch (ScanException e) {
			e.printStackTrace();
		} catch (PolicyException e) {
			e.printStackTrace();
		}
		return value;
	}
}
