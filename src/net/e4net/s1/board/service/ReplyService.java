package net.e4net.s1.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.TestService;

@Service("ReplyService")
public class ReplyService extends TestService{
	SqlSession SqlSession;
	
	@SuppressWarnings("unchecked")
	public List<ReplyVO> list(int replyBno){
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			List<ReplyVO> vo = SqlSession.selectList("reply.listReply", replyBno);
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
}
