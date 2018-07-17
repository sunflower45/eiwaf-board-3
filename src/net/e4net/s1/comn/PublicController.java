package net.e4net.s1.comn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.e4net.eiwaf.service.resource.RequestDataProperty;
import net.e4net.eiwaf.web.RequestContext;

import org.springframework.web.servlet.ModelAndViewDefiningException;

/**
 * 비로그인 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
public class PublicController extends TestController {

	private static final long serialVersionUID = 1346223631953378365L;

	@Override
	public ControllerType getServiceType() {
		return ControllerType.PUBLIC;
	}

	@Override
	protected boolean isLogin(HttpServletRequest request,
			HttpServletResponse response, RequestContext requestContext)
			throws ModelAndViewDefiningException {
		return true;
	}

	protected boolean isLoginInternal(HttpServletRequest request,
			HttpServletResponse response, RequestContext requestContext)
			throws ModelAndViewDefiningException {
		String ctrltype = requestContext.getRequestProperty(RequestDataProperty.TYPE);
		if (ControllerType.LOGIN.equalsType(ctrltype)) {
			return requestContext.isLogin();
		}
		return true;
	}

}