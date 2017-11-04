package com.cssnb.baseframework.quickstart.exception;

import java.util.HashMap;
/**
 * <b>Description:</b></br> 
 * <b>Title:</b>Spring 异常处理
 * @company:Twosnail
 * @author: 两只蜗牛
 * @Date: 2015年1月7日上午9:26:34
 * @version 1.0
 */
public class SystemException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3546977931922180877L;
	
	/**
	 * 直接返回内容
	 */
	public static final int NONE = 0;
	/**
	 * request.getRequestDispatcher( "*.jsp" ).forward( arg0, arg1 )
	 */
	public static final int FORWARD = 1;
	
	/**
	 * 类似response.sendRedirect( "*.jsp" )
	 */
	public static final int REDIRECT = 2;
	
	
	private String responseBody;
	
	private String encode = "utf-8";
	
	private int forwardType = FORWARD;
	
	private HashMap<String,?> attributes;
	
	private String modelPath;
	
	
	/**
	 * 直接返回http内容
	 * @param responseBody - http内容，例如json
	 */
	public SystemException( String responseBody, String encode ) {
		super();
		this.responseBody = responseBody;
		this.encode = encode;
		this.forwardType = NONE;
	}
	
	/**
	 * 返回jsp页面的.
	 * 类似<br/>
	 * request.setAttrebute( "", obj );<br/>
	 * request.getRequestDispatcher( "*.jsp" ).forward( arg0, arg1 );<br/>
	 * @param modelPath - 页面路劲
	 * @param responseAttributes - 向jsp页面传递的数据
	 */
	public SystemException( String modelPath, HashMap<String,?> attributes ) {
		super();
		this.modelPath = modelPath;
		this.attributes = attributes;
		this.forwardType = FORWARD;
	}
	
	/**
	 * 直接返回http内容
	 * @param responseBody - http内容，例如json
	 */
	public SystemException( String responseBody, String encode, Throwable cause ) {
		super( cause );
		this.responseBody = responseBody;
		this.encode = encode;
		this.forwardType = NONE;
	}
	
	/**
	 * 返回jsp页面的.
	 * 类似<br/>
	 * request.setAttrebute( "", obj );<br/>
	 * request.getRequestDispatcher( "*.jsp" ).forward( arg0, arg1 );<br/>
	 * @param modelPath - 页面路劲
	 * @param responseAttributes - 向jsp页面传递的数据
	 */
	public SystemException( String modelPath, HashMap<String,?> attributes, Throwable cause ) {
		super( cause );
		this.modelPath = modelPath;
		this.attributes = attributes;
		this.forwardType = FORWARD;
	}

	/**
	 * 返回页面
	 * @param modelPath
	 * @param forwardType SystemException.FORWARD 类似request.getRequestDispatcher( "*.jsp" ).forward( arg0, arg1 )
	 * 					  SystemException.REDIRECT 类似response.sendRedirect( "*.jsp" );
	 */
	public SystemException( String modelPath, int forwardType ) {
		
		super();
		this.modelPath = modelPath;
		this.forwardType = forwardType;
	}
	
	/**
	 * 返回页面
	 * @param modelPath
	 * @param forwardType SystemException.FORWARD 类似request.getRequestDispatcher( "*.jsp" ).forward( arg0, arg1 )
	 * 					  SystemException.REDIRECT 类似response.sendRedirect( "*.jsp" );
	 */
	public SystemException( String modelPath, int forwardType, Throwable cause ) {
		
		super( cause );
		this.modelPath = modelPath;
		this.forwardType = forwardType;
	}
	
	
	
	String getResponseBody() {
		return responseBody;
	}

	HashMap<String, ?> getAttributes() {
		return attributes;
	}

	String getModelPath() {
		return modelPath;
	}

	public String getEncode() {
		return encode;
	}

	int getForwardType() {
		return forwardType;
	}
	
}
