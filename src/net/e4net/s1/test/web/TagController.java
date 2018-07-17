package net.e4net.s1.test.web;

import java.util.List;

import javax.annotation.Resource;

import net.e4net.eiwaf.service.resource.Code;
import net.e4net.eiwaf.service.resource.CodeService;
import net.e4net.eiwaf.service.resource.RequestProperty;
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.s1.comn.PublicController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Tag 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
@RequestProperty(title = "Tag테스트", layout = "empty")
@Controller
public class TagController extends PublicController {

	private static final long serialVersionUID = -5907085476868187403L;

	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestProperty(title = "JSTL기본태그")
	@RequestMapping("/test/jstl.do")
	public ModelAndView reset() throws Exception {
		ModelAndView mav = new ModelAndView("test/jstl");

		List<Code> foreach1 = codeService.getCodeList("TEL");

		mav.addObject("foreach1", foreach1);
		mav.addObject("if1", null);
		mav.addObject("if2", "");

		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "포멧태그")
	@RequestMapping("/test/format.do")
	public ModelAndView reset(
			RequestContext requestContext) throws Exception {
		ModelAndView mav = new ModelAndView("test/format");

		return getOkModelAndView(mav);
	}

}