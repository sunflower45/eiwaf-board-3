package net.e4net.s1.comn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.e4net.eiwaf.web.RequestContext;

import org.springframework.web.servlet.ModelAndViewDefiningException;

/**
 * 로그인 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
public class LoginController extends TestController {

	private static final long serialVersionUID = 1346223631953378365L;

	@Override
	public ControllerType getServiceType() {
		return ControllerType.LOGIN;
	}

	@Override
	protected boolean isLogin(HttpServletRequest request,
			HttpServletResponse response, RequestContext requestContext)
			throws ModelAndViewDefiningException {
		return requestContext.isLogin();
	}

}