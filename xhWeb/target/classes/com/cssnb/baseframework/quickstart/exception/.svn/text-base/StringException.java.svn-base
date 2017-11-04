package com.cssnb.baseframework.quickstart.exception;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>Spring 异常处理
 * @company:Twosnail
 * @author: 两只蜗牛
 * @Date: 2015年1月7日上午9:26:34
 * @version 1.0
 */
public class StringException extends Exception {

	/** serialVersionUID */
	private static final long serialVersionUID = 2332608236621015980L;

	private String code;

	public StringException() {
		super();
	}

	public StringException(String message) {
		super(message);
	}

	public StringException(String code, String message) {
		super(message);
		this.code = code;
	}

	public StringException(Throwable cause) {
		super(cause);
	}

	public StringException(String message, Throwable cause) {
		super(message, cause);
	}

	public StringException(String code, String message, Throwable cause) {
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
