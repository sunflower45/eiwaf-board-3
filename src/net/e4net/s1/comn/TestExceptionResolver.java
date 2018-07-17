package net.e4net.s1.comn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.common.StatusException;
import net.e4net.eiwaf.dao.BizException;
import net.e4net.eiwaf.dao.DaoException;
import net.e4net.eiwaf.util.StringUtil;
import net.e4net.eiwaf.web.handler.DefaultExceptionResolver;
import net.e4net.eiwaf.web.handler.RuntimeRequestContext;

import org.springframework.web.servlet.ModelAndView;

/**
 * 예외처리.
 * @author E4NET
 * @version 1.0
 */
public class TestExceptionResolver extends DefaultExceptionResolver {

	private static final long serialVersionUID = 2745380944895786141L;

	@Override
	protected ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex,
			RuntimeRequestContext requestContext) {
		if (ex instanceof DaoException) {
			Status status;
			if (ex instanceof BizException) {
				BizException bex = (BizException) ex;
				String msgCode = bex.getMsgCode();
				if (StringUtil.isNullOrEmpty(msgCode)) {
					status = Status.getStatusDAOException();
				} else {
					status = new Status();
					status.fail(msgCode);
				}
				Status.setUserDefineCode(status, StatusType.USER_1000.getCode());
			} else {
				status = Status.getStatusDAOException();
			}
			return super.resolveException(request, response, handler,
							new StatusException(status, ex), requestContext);	
		}
		return super.resolveException(request, response, handler, ex, requestContext);
	}

	@Override
	protected void resolverPrintStackTrace(StatusException ex) {
		Status status = ex.getStatus();
		int code = status.getCode();
		if (code == Status.SESSION_TIMEOUT
				|| code == Status.AUTHORITY_EXCEPTION
				|| code == StatusType.USER_1000.getCode()
				){
			//예외로그 생략
		} else {
			super.resolverPrintStackTrace(ex);	
		}
	}

}