package net.e4net.s1.comn;

import net.e4net.eiwaf.web.AbstractUserEntity;

/**
 * 사용자 세션.
 * @author E4NET
 * @version 1.0
 */
public class TestUserEtt extends AbstractUserEntity {

	private static final long serialVersionUID = -1256196766588763961L;

	private String userId;	//사용자ID
	private String name;	//사용자명
	private String grpCl;	//그룹분류

	public TestUserEtt(String userId) {
		this.userId = userId;
	}

	@Override
	public Object getAbstractUserEntityId() {
		return getUserId();
	}

	@Override
	public String toUserEntityString() {
		return getUserId();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrpCl() {
		return grpCl;
	}

	public void setGrpCl(String grpCl) {
		this.grpCl = grpCl;
	}

}