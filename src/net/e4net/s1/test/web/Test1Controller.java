package net.e4net.s1.test.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.e4net.eiwaf.service.resource.Code;
import net.e4net.eiwaf.service.resource.CodeService;
import net.e4net.eiwaf.service.resource.RequestProperty;
import net.e4net.eiwaf.util.StringUtil;
import net.e4net.eiwaf.web.util.page.PageNavigator;
import net.e4net.s1.comn.LoginController;
import net.e4net.s1.test.service.Test1Service;
import net.e4net.s1.test.vo.UserDVO;
import net.e4net.s1.test.vo.UserPVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 테스트 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
@RequestProperty(title = "테스트", layout = "empty")
@Controller
public class Test1Controller extends LoginController {

	private static final long serialVersionUID = 2525244630168443366L;

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "Test1Service")
	private Test1Service test1Service;

	/**
	 * 사용자 목록화면.
	 * @param userPVO 사용자 VO
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "사용자 목록화면")
	@RequestMapping("/test/userList.do")
	public ModelAndView userList(
			@ModelAttribute("userPVO") UserPVO userPVO) throws Exception {
		ModelAndView mav = new ModelAndView("test/userList");

		List<Code> codeList = codeService.getCodeList("USERSTATUS");

		mav.addObject("codeList", codeList);

		return getOkModelAndView(mav);
	}

	/**
	 * 사용자 목록화면.
	 * @param userSVO 사용자 VO
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "사용자목록")
	@RequestMapping("/test/userListAjax.do")
	public ModelAndView userListAjax(
			@ModelAttribute("userSVO") UserPVO userSVO) throws Exception {
		ModelAndView mav = new ModelAndView("jstl-ajax:test/userListAjax");

		userSVO.setSt_login_dt(StringUtil.remove(userSVO.getSt_login_dt(), "."));
		userSVO.setEd_login_dt(StringUtil.remove(userSVO.getEd_login_dt(), "."));

		List<UserDVO> list = test1Service.selectUserList(userSVO);
		PageNavigator pageNav = PageNavigator.getInstance(userSVO, list);

		Map<String, Code> codeMap = codeService.getCodeMap("USERSTATUS");

		mav.addObject("codeMap", codeMap);
		mav.addObject("list", list);
		mav.addObject("pageNav", pageNav);

		return getOkModelAndView(mav);
	}

//	/**
//	 * 사용자 상세화면.
//	 * @param userSVO 사용자 VO
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestProperty(title = "사용자 상세화면")
//	@RequestMapping("/test/userDetail.adm")
//	public ModelAndView userDetail(
//			@ModelAttribute("userSVO") UserSVO userSVO) throws Exception {
//
//		ModelAndView mav = new ModelAndView("test/userDetail");
//
//		List<UserDVO> list = testService.selectUserList(userSVO);
//		PageNavigator pageNav = PageNavigator.getInstance(userSVO, list);
//
//		mav.addObject("codeMap", codeMap);
//		mav.addObject("list", list);
//		mav.addObject("pageNav", pageNav);
//
//		return getOkModelAndView(mav);
//	}
}