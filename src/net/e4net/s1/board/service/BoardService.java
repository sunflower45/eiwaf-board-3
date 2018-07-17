package net.e4net.s1.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.comn.TestService;

@Service("BoardService")
public class BoardService extends TestService {
	
	SqlSession SqlSession;
	
	public int countArticle(String searchOption, String keyword) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			int i = (int) SqlSession.selectOne("BoardService.countArticle", map);
			SqlSession.commit();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return -1;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
		
	}
	public void create(BoardVO vo, HttpServletRequest request) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.insert("BoardService.insert", vo);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public BoardVO read(int boardBno) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			BoardVO vo = (BoardVO) SqlSession.selectOne("BoardService.view", boardBno);
			SqlSession.commit();
			return vo;
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
		
	}
	
	
	public void update(BoardVO vo) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("BoardService.updateArticle", vo);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public void delete(int boardBno) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.delete("BoardService.deleteArticle", boardBno);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}

	
	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll(int start, int end,  String searchOption, String keyword) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			List<BoardVO> vo = (List<BoardVO>)SqlSession.selectList("BoardService.listAll", map);
			SqlSession.commit();
			return vo;
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}		
	}
	
	

	public void increaseViewcnt(int boardBno, HttpSession session) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			long update_time = 0;
			if(session.getAttribute("update_time_"+boardBno)!=null) {
				update_time = (long)session.getAttribute("update_time_"+boardBno);
				
			}
			long current_time = System.currentTimeMillis();
			if(current_time - update_time > 5*1000) {
				SqlSession.update("BoardService.increaseViewcnt", boardBno);
				session.setAttribute("update_time_"+boardBno, current_time);
			}
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}

	}
}