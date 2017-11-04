/**
 * 
 */
package com.cssnb.baseframework.quickstart.shiro;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author Administrator
 *
 */
public class MyFormAuthentication extends FormAuthenticationFilter {

	private static Logger logger = LoggerFactory.getLogger(MyFormAuthentication.class);
	
	private long  maxLoginAttempts = 10;
	
	public static ConcurrentHashMap<String, AtomicLong> accountLockMap   = new ConcurrentHashMap<String, AtomicLong>();
	
	protected static final String DEFAULT_CAPTCHA_PARAM = "captcha";
	private String captchaParam =DEFAULT_CAPTCHA_PARAM;
	
	public String getCaptchaParam() {
        return captchaParam;
    }

    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, getCaptchaParam());
    }
	
    public AuthenticationToken createToken(ServletRequest request, ServletResponse response,Map yh) {
    	/*String username =(String)yh.get("YHM");
    	String password = (String)yh.get("MM");*/
    	String username = getUsername(request);
    	String password = getPassword(request);
//        password = DigestUtils.md5Hex(password);
        String captcha = getCaptcha(request)+"123";
    	boolean rememberMe = isRememberMe(request);
    	String host = getHost(request);
    	AuthenticationToken token = new  CaptchaUsernamePasswordToken(username, password, rememberMe, host,captcha) ;
    	return   token ;
    }
    public AuthenticationToken createToken2(ServletRequest request, ServletResponse response) {
    	String username = getUsername(request);
    	String password = getPassword(request);
//        password = DigestUtils.md5Hex(password);
        String captcha = getCaptcha(request)+"213";
    	boolean rememberMe = isRememberMe(request);
    	String host = getHost(request);
    	return new CaptchaUsernamePasswordToken(username, password, rememberMe, host,captcha);
    }

	@Override
	protected boolean executeLogin(ServletRequest request,
			ServletResponse response) throws Exception {
		AuthenticationToken token = createToken(request, response);
		if (token == null) {
            String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken "
                    + "must be created in order to execute a login attempt.";
            throw new IllegalStateException(msg);
        }
		if (checkIfAccountLocked(request)) {
            return onLoginFailure(token, new ExcessiveAttemptsException("登录失败超过3次，账号已被锁定！"), request, response);
        } else {
            if (!doLogin(request, response, token)) {
                resetAccountLock(getUsername(request));
                return false;
            }
            return true;
        }
	}
	
	private boolean checkIfAccountLocked(ServletRequest request) {
        String username = getUsername(request);
        if (accountLockMap.size() > 0 && username != null) {
            if (accountLockMap.get((String)username) != null) {
                long remainLoginAttempts = accountLockMap.get((String) username).get();
                if (remainLoginAttempts <= 0) {
                    return true;
                }
            }
        }
        return false;
    }
	
	private boolean doLogin(ServletRequest request, ServletResponse response, AuthenticationToken token)
            throws Exception {
        try {
            Subject subject = getSubject(request, response);
            subject.login(token);
            return onLoginSuccess(token, subject, request, response);
        } catch (IncorrectCredentialsException e) {
            decreaseAccountLoginAttempts(request);
            checkIfAccountLocked(request);
            return onLoginFailure(token, e, request, response);
        } catch (AuthenticationException e) {
            return onLoginFailure(token, e, request, response);
        }
    }

    private void decreaseAccountLoginAttempts(ServletRequest request) {
        AtomicLong initValue = new AtomicLong(maxLoginAttempts);
        AtomicLong remainLoginAttempts = accountLockMap.putIfAbsent(getUsername(request), new AtomicLong(maxLoginAttempts));
        if (remainLoginAttempts == null) {
            remainLoginAttempts = initValue;
        }
        remainLoginAttempts.getAndDecrement();
        accountLockMap.put(getUsername(request), remainLoginAttempts);
    }

    private void resetAccountLock(String username) {
        accountLockMap.put(username, new AtomicLong(maxLoginAttempts));
    }

    public void setMaxLoginAttempts(long maxLoginAttempts) {
        this.maxLoginAttempts = maxLoginAttempts;
    }
    
    @Override
    protected void setFailureAttribute(ServletRequest request, AuthenticationException ae) {
        //String className = ae.getClass().getName();
        request.setAttribute(getFailureKeyAttribute(), ae.getMessage());
    }
}