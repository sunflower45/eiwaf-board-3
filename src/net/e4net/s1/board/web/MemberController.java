package net.e4net.s1.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.MemberService;
import net.e4net.s1.board.vo.MemberVO;
import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/member/*")
public class MemberController extends PublicController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="admin.do")
	public ModelAndView admin(HttpServletRequest request) throws Exception {

		List<MemberVO> list = memberService.memberList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/admin");
		mav.addObject("list", list);
		
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	
		
	}
	
	@RequestMapping(value="view.do", method=RequestMethod.POST)
	public ModelAndView memberView(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		MemberVO dto = memberService.memberRead(vo.getMemberId());
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/memberView");
    	mav.addObject("dto", dto);
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	
	@RequestMapping(value="delete.do")
	public ModelAndView memberDelete(@RequestParam String memberId, Model model, HttpServletRequest request) throws Exception {
		memberService.deleteMember(memberId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/admin.do");
		
		Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	
	@RequestMapping(value="update.do")
	public ModelAndView memberUpdate(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		memberService.updateMember(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/admin.do");
		Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
		
	}
	
	@RequestMapping("pwUpdate.do")
	public ModelAndView pwUpdate(HttpServletRequest request) throws Exception{
		System.out.println("&&&&&&&&&&&");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/updatePw");

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="adminWrite.do")
	public ModelAndView adminWrite(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/adminWrite");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	
		
	}
	
	@RequestMapping(value="insert.do")
	public ModelAndView memberInsert(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		memberService.insertMember(vo);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	
	}
	
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheck(@ModelAttribute("vo") MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		String idList = memberService.idCheck(vo);
		mav.addObject("cnt", idList);
		mav.addObject("memberId", vo.getMemberId());
		
		return getOkModelAndView(mav);
		
	}
	
	@RequestMapping("find.do")
	public ModelAndView find(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("");
		mav.setViewName("/board/find");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}		
	}
	
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute("vo") MemberVO vo)throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
			String idList = memberService.findId(vo);
			mav.addObject("memberId", idList);
			return getOkModelAndView(mav);
	}
	
	@RequestMapping(value="findPw.do", method=RequestMethod.POST)
	public ModelAndView findPw(@ModelAttribute("vo") MemberVO vo) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		try {
			String pwList = memberService.findPw(vo);
			mav.addObject("memberPw", pwList);
			return getOkModelAndView(mav);
		} catch(Exception e) {
			mav.addObject("memberPw", null);
			return getOkModelAndView(mav);
		}
		
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		String name = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		session = request.getSession(true);
		session.setAttribute("member", vo);
		if(name != null) {
			MemberVO vo2 = memberService.viewMember(vo);
			mav.setViewName("main/main");
			mav.addObject("msg", "success");
			session.setAttribute("memberId", vo2.getMemberId());
			session.setAttribute("memberName", vo2.getMemberName());
		} else {
			mav.setViewName("main/main");
			mav.addObject("msg", "failure");
		}
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	@RequestMapping("join.do")
	public ModelAndView join(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/join");

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="joinUpdate.do", method=RequestMethod.POST)
	public ModelAndView joinUpdate(@ModelAttribute("vo") MemberVO vo, HttpServletRequest request) throws Exception{
		memberService.joinUpdate(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}

	@RequestMapping(value="updatePwMember.do")
	public ModelAndView updatePwMember(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		memberService.pwUpdate(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);

		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, HttpServletRequest request) throws Exception{
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("msg", "logout");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
}