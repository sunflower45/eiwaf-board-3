package net.e4net.s1.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.TestService;

@Service("ReplyService")
public class ReplyService extends TestService{
	SqlSession SqlSession;
	
	@SuppressWarnings("unchecked")
	public List<ReplyVO> list(int replyBno, int start, int end){
		SqlSession = null;
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("replyBno", replyBno);
			map.put("start", start);
			map.put("end", end);
			SqlSession = openSession(true);
			List<ReplyVO> vo = SqlSession.selectList("reply.listReply", map);
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
	
	public void create(ReplyVO vo) {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.insert("reply.insertReply", vo);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
		
	}
	
	public void update(ReplyVO vo) {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("reply.updateReply", vo);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
		
	}
	
	public void delete(int replyRno) {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("reply.deleteReply", replyRno);		
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public ReplyVO detail(int replyRno) {
		
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			
			ReplyVO vo = (ReplyVO) SqlSession.selectOne("reply.detailReply", replyRno);
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
	public int count(int replyBno) {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			int cnt = (int) SqlSession.selectOne("reply.countReply", replyBno);		
			SqlSession.commit();
			return cnt;
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return -1;
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
}
