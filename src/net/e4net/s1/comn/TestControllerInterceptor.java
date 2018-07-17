package net.e4net.s1.comn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.handler.DefaultControllerInterceptor;
import net.e4net.eiwaf.web.handler.RuntimeRequestContext;
import net.e4net.eiwaf.web.util.WebUtil;

import org.springframework.web.servlet.ModelAndView;

/**
 * 컨트롤러 제어.
 * 
 * @author E4NET
 * @version 1.0
 */
public class TestControllerInterceptor extends DefaultControllerInterceptor {

	private static final long serialVersionUID = -4727846149815195658L;

	private static final String SYSTEM_NAME = "S1";

	@Override
	protected boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			RuntimeRequestContext requestContext) throws Exception {
		TestController controller = (TestController) handler;
		if (!controller.isLogin(request, response, requestContext)) {
			ModelAndView mav = new ModelAndView("redirect:/");
			Status status = Status.getStatusSessionTimeout();
			WebUtil.throwModelAndViewDefiningException(mav, status);
		}
		return true;
	}

	/*
	@Override
	protected void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView, RuntimeRequestContext requestContext)
			throws Exception {
	}

	@Override
	protected void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex,
			RuntimeRequestContext requestContext) {
		if (isDebugEnabled()) {
			debug(getAccessLog(request, response, ex, requestContext));	
		}
		OR
		super.afterCompletion(request, response, handler, ex, requestContext);
	}
	 */

	@Override
	protected String getSystemName() {
		return SYSTEM_NAME;
	}

}