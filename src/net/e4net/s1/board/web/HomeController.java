package net.e4net.s1.board.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.net.httpserver.HttpsServer;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/*")
public class HomeController extends PublicController{

	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("msg", "홈페이지 방문을 환영합니다.");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	
	
}
