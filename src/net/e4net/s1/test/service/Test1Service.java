package net.e4net.s1.test.service;

import java.util.List;

import net.e4net.s1.comn.TestService;
import net.e4net.s1.test.vo.UserDVO;
import net.e4net.s1.test.vo.UserPVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

/**
 * 테스트 서비스.
 * @author E4NET
 * @version 1.0
 */
@Service("Test1Service")
public class Test1Service extends TestService {

	private static final long serialVersionUID = -6849535441093100984L;

	/**
	 * 사용자 목록.
	 * @param pvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<UserDVO> selectUserList(UserPVO pvo) throws Exception {
		List<UserDVO> list = null;
		SqlSession session = null;
		try {
			session = openSession(true);
			list = (List<UserDVO>) session.selectList("test.selectUserList", pvo);
		} catch (Throwable t) {
			daoException(t);
		} finally {
			closeSession(session);
		}
		return list;
	}

	/**
	 * 사용자 상세.
	 * @param pvo
	 * @return
	 * @throws Exception
	 */
	public UserDVO selectUserDetail(UserPVO pvo) throws Exception {
		UserDVO dvo = null;
		SqlSession session = null;
		try {
			session = openSession(true);
			dvo = (UserDVO) session.selectOne("test.selectUserDetail", pvo);
		} catch (Throwable t) {
			daoException(t);
		} finally {
			closeSession(session);
		}
		return dvo;
	}

}