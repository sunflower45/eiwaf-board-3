package net.e4net.s1.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.ReplyService;
import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.board.vo.ReplyPager;
import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/reply/*")
public class ReplyController extends PublicController {
	
	@Autowired
	ReplyService replyService;
	
	// 댓글 삽입
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("rvo") ReplyVO rvo, @ModelAttribute("bvo") BoardVO bvo) {
		ModelAndView mav = new ModelAndView("jsonView");
		rvo.setReplyBno(bvo.getBoardBno());
		replyService.create(rvo);
		return getOkModelAndView(mav);
    	
	}
	
	// 댓글 리스트
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam int replyBno, 
			@RequestParam(defaultValue="1")int curPage,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// 뎃글 페이징
		int count = replyService.count(replyBno);
		ReplyPager replyPager = new ReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		
		List<ReplyVO> list = replyService.list(replyBno, start, end);
		
		mav.setViewName("board/replyList");
		mav.addObject("list", list);
		mav.addObject("replyPager", replyPager);
    	
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	

	// 댓글 수정시 상세보기
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView replyDetail(@RequestParam  int replyRno, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ReplyVO vo = replyService.detail(replyRno);
		mav.setViewName("board/replyDetail");
		mav.addObject("vo", vo);
		
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}

	
	// 댓글 수정
	@RequestMapping(value="update.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView replyUpdate(@ModelAttribute("vo") ReplyVO vo) {
		ModelAndView mav = new ModelAndView("jsonView");
		replyService.update(vo);
		mav.addObject("vo", vo);
		return getOkModelAndView(mav);
	
}
	
	 // 댓글 삭제
	@RequestMapping(value="delete.do")
	public ModelAndView replyDelete(@RequestParam String replyRno,  HttpServletRequest request) {
		int rno = Integer.parseInt(replyRno);
		ModelAndView mav = new ModelAndView();
		replyService.delete(rno);
		System.out.println("delete3");

		mav.addObject("msg", "success");
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
			System.out.println("delete3");

    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
		
	}	
}
