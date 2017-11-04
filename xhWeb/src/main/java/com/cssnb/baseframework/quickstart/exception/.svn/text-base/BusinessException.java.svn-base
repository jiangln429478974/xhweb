package com.cssnb.baseframework.quickstart.exception;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>Spring 异常处理
 * @company:Twosnail
 * @author: 两只蜗牛
 * @Date: 2015年1月7日上午9:26:34
 * @version 1.0
 */
public class BusinessException extends Exception {

	/** serialVersionUID */
	private static final long serialVersionUID = 2332608236621015980L;

	private String code;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(String code, String message) {
		super(message);
		this.code = code;
	}

	public BusinessException(Throwable cause) {
		super(cause);
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
	}

	public BusinessException(String code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
