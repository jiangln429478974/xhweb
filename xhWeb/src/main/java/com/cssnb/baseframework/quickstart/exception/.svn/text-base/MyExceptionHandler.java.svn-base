package com.cssnb.baseframework.quickstart.exception;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
/**
 * <b>Description:</b></br> 
 * <b>Title:</b>Spring 异常处理
 * @company:Twosnail
 * @author: 两只蜗牛
 * @Date: 2015年1月7日上午9:26:34
 * @version 1.0
 */
public class MyExceptionHandler implements HandlerExceptionResolver {

	public ModelAndView resolveException( HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception exception ) {
		
		System.out.println( "【抛出异常】--异常路径为：" + request.getServletPath() + "\n【异常信息】--" +  exception.getMessage() ) ;
		//如果不是抛出的action业务异常则不处理
		if( !( exception instanceof SystemException ) ) {
			return null;
		}
		
		final SystemException actionE = (SystemException) exception;
		
		ModelAndView model = null;
		if( actionE.getForwardType() == SystemException.FORWARD ) {
			//进入页面渲染
			model = new ModelAndView( actionE.getModelPath(), actionE.getAttributes() );
		} else if( actionE.getForwardType() == SystemException.REDIRECT ) {
			model = new ModelAndView( new RedirectView( actionE.getModelPath(), true ) );
		} else {
			//直接返回页面内容
			model = new ModelAndView( new View() {
				@Override
				public void render(Map<String, ?> arg0, HttpServletRequest arg1,
						HttpServletResponse arg2) throws Exception {
					
					arg2.setContentType( "text/html" );
					arg2.setCharacterEncoding( actionE.getEncode() );
					if( actionE.getResponseBody() != null ) {
						arg2.getWriter().print( actionE.getResponseBody() );
					}
				}
				
				@Override
				public String getContentType() {
					return "text/html; charset=utf-8";
				}
			} );
		}
		
		return model;
	}
}
