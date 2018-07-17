package net.e4net.s1.comn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.e4net.eiwaf.web.RequestContext;
import net.e4net.eiwaf.web.handler.AbstractController;

import org.springframework.web.servlet.ModelAndViewDefiningException;

/**
 * 추상 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
public abstract class TestController extends AbstractController {

	private static final long serialVersionUID = 669392080317793556L;

	//Controller 로거명을 하나로 통일한다. 필요 시 로거명을 활용해서 로거 속성을 설정한다.
	public TestController() {
		super(TestController.class.getName());
	}

	abstract public ControllerType getServiceType();

	protected abstract boolean isLogin(HttpServletRequest request,
			HttpServletResponse response, RequestContext requestContext) throws ModelAndViewDefiningException;

}