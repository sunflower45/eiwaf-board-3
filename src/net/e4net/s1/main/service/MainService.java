package net.e4net.s1.main.service;

import net.e4net.s1.comn.TestService;
import net.e4net.s1.main.vo.LoginPVO;
import net.e4net.s1.main.vo.LoginDVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

/**
 * 로그인 서비스.
 * @author E4NET
 * @version 1.0
 */
@Service("MainService")
public class MainService extends TestService {

	private static final long serialVersionUID = -6849535441093100984L;

	/**
	 * 로그인 정보 조회.
	 * @param pvo
	 * @return
	 * @throws Exception
	 */
	public LoginDVO selectLogin(LoginPVO pvo) throws Exception {
		LoginDVO dvo = null;
		SqlSession session = null;
		try {
			session = openSession(true);
			dvo = (LoginDVO) session.selectOne("main.selectLogin", pvo);
		} catch (Throwable t) {
			daoException(t);
		} finally {
			closeSession(session);
		}
		return dvo;
	}

	/**
	 * 로그인 정보 업데이트.
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	public int updateLogin(LoginDVO dvo) throws Exception {
		int updCnt = -1;
		SqlSession session = null;
		try {
			session = openSession(true);
			updCnt = session.update("main.updateLogin", dvo);
		} catch (Throwable t) {
			daoException(t);
		} finally {
			closeSession(session);
		}
		return updCnt;
	}

}