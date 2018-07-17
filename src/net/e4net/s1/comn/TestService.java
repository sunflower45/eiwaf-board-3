package net.e4net.s1.comn;

import net.e4net.eiwaf.dao.mybatis.SqlSessionSimpleDaoSupport;

/**
 * 추상 서비스.
 * @author E4NET
 * @version 1.0
 */
public abstract class TestService extends SqlSessionSimpleDaoSupport {

	private static final long serialVersionUID = -3247663664345770050L;

	//Service 로거명을 하나로 통일한다. 필요 시 로거명을 활용해서 로거 속성을 설정한다.
	public TestService() {
		super(TestService.class.getName());
	}

}