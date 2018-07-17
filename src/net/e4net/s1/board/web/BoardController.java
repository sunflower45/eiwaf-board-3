package net.e4net.s1.board.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.BoardService;
import net.e4net.s1.board.service.ReplyService;
import net.e4net.s1.board.vo.BoardPager;
import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.PublicController;
  
@Controller
@RequestMapping("/board/*")
public class BoardController extends PublicController {
	
	@Autowired
	BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	ReplyService replyService;
	
	@Resource(name="uploadPath")
    String uploadPath;
	
	
    @RequestMapping(value="list.do")
	public ModelAndView list(@RequestParam(defaultValue="board_title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage, 
			HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession();
    	String memberName = (String) session.getAttribute("memberName");
    	
    	int count = boardService.countArticle(searchOption, keyword);
    	
    	BoardPager boardPager = new BoardPager(count, curPage);
    	int start = boardPager.getPageBegin();
    	int end = boardPager.getPageEnd();
    	List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
    	
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("list", list);
    	map.put("count", count);
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	map.put("boardPager", boardPager);
    	
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("map", map);
		mav.addObject("memberName", memberName);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
    
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int boardBno, @ModelAttribute("rvo") ReplyVO rvo,
    		int curPage, String searchOption, String keyword,
    		HttpSession session, HttpServletRequest request)throws Exception{
    	boardService.increaseViewcnt(boardBno, session);
    	
    	BoardVO dto = boardService.read(boardBno);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto", dto);
		mav.addObject("page_no", rvo.getPage_no());

    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    
    
    @RequestMapping(value="write.do", method=RequestMethod.GET)
    public ModelAndView write(HttpServletRequest request) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/write");
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    

    
    @RequestMapping(value="modify.do", method=RequestMethod.GET)
    public ModelAndView modify(@RequestParam int boardBno, HttpServletRequest request) throws Exception {
    	BoardVO dto = boardService.read(boardBno);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/modify");
    	mav.addObject("dto", dto);
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    
       
     
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public ModelAndView insert(@RequestParam String boardTitle, @RequestParam String boardContent, @RequestParam MultipartFile file, HttpServletRequest request, HttpSession session) throws Exception{
    	logger.info("파일 이름 : "+file.getOriginalFilename());
    	logger.info("파일 크기 : "+file.getSize());
    	logger.info("컨텐트 타입 : "+file.getContentType());
    	
    	String savedName = file.getOriginalFilename();
    	File target = new File(uploadPath, savedName);
    	
    	FileCopyUtils.copy(file.getBytes(), target);
    	
    	ModelAndView mav = new ModelAndView("redirect:/board/list.do");
    	
    	mav.addObject("savedName", savedName);
    	BoardVO vo = new BoardVO();
    	String writer = (String)session.getAttribute("memberId");
    	vo.setBoardWriter(writer);
    	vo.setBoardContent(boardContent);
    	vo.setBoardTitle(boardTitle);
    	vo.setBoardFileName(savedName);
    	vo.setBoardFileSize(file.getSize());
    	boardService.create(vo, request);
    	
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    
    @ResponseBody
    @RequestMapping(value="downloadFile.do")
    public ResponseEntity<byte[]> downloadFile(@RequestParam String fileName, HttpServletResponse response) throws Exception {
    	InputStream in = null;
    	ResponseEntity<byte[]> entity = null;
    	System.out.println(fileName);
    	try {
    		in = new FileInputStream(uploadPath + fileName);
    		fileName = fileName.substring(fileName.indexOf("_")+1);
    		HttpHeaders headers = new HttpHeaders();
    		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
    		headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
    		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
    	} catch(Exception e) {
    		e.printStackTrace();
    		entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
    	}finally {
    		in.close();
    	}
    	System.out.println("entity : "+entity);
    	return entity;
    }
    
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public ModelAndView update(@ModelAttribute BoardVO vo) throws Exception{
    	boardService.update(vo);
    	return getOkModelAndView("redirect:/board/list.do");
    }
    
    @RequestMapping("delete.do")
    public ModelAndView delete(@RequestParam int boardBno) throws Exception{
    	boardService.delete(boardBno);
    	return getOkModelAndView("redirect:/board/list.do");
    }
}