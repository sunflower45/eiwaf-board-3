package net.e4net.s1.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.e4net.s1.board.vo.MemberVO;
import net.e4net.s1.comn.TestService;

@Service
public class MemberService extends TestService{

	SqlSession SqlSession;
	
	public List<MemberVO> memberList() throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			List<MemberVO> list = (List<MemberVO>) SqlSession.selectList("member.memberList");
			SqlSession.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	public void deleteMember(String memberId) {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("member.deleteMember", memberId);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	public void updateMember(MemberVO vo) throws Exception {
		
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("member.updateMember", vo);
			SqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public MemberVO memberRead(String memberId) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			MemberVO vo = (MemberVO) SqlSession.selectOne("member.readMember", memberId);
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
	public void insertMember(MemberVO vo) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.insert("member.insertMember", vo);
			SqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	public String idCheck(MemberVO vo) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			String s = (String) SqlSession.selectOne("member.idCheck", vo);		
			SqlSession.commit();
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public String findId(MemberVO vo) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			String s = (String) SqlSession.selectOne("member.findId", vo);		
			SqlSession.commit();
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}

	}
	
	public String findPw(MemberVO vo) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			String s = (String) SqlSession.selectOne("member.findPw", vo);		
			SqlSession.commit();
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}

	}
	public void joinUpdate(MemberVO vo) throws Exception {

		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("member.joinMember", vo);
			SqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	public void pwUpdate(MemberVO vo) throws Exception {
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			SqlSession.update("member.updatePw", vo);
			SqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	public String loginCheck(MemberVO vo, HttpSession session) throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			String name = (String) SqlSession.selectOne("member.loginCheck", vo);
			SqlSession.commit();
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
		
	}
	
	public MemberVO viewMember(MemberVO vo)  throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			MemberVO vo2 = (MemberVO)SqlSession.selectOne("member.viewMember",vo);
			SqlSession.commit();
			return vo2;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return null;
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
	
	public void logout(HttpSession session)  throws Exception{
		SqlSession = null;
		try {
			SqlSession = openSession(true);
			session.invalidate();
			SqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		} finally {
			if(SqlSession != null) SqlSession.close();
		}
	}
}