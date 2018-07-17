package net.e4net.s1.main.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.e4net.eiwaf.common.AbstractVO;

/**
 * 濡쒓렇�씤 ParameterVO.
 * @author E4NET
 * @version 1.0
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class LoginPVO extends AbstractVO {

	private static final long serialVersionUID = -738415059274010232L;

	private String user_id;			//�궗�슜�옄�븘�씠�뵒
	private String login_passwd;	//濡쒓렇�씤�뙣�뒪�썙�뱶
	
	public String getUser_id() {
		return user_id;
	}
	public String getLogin_passwd() {
		return login_passwd;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setLogin_passwd(String login_passwd) {
		this.login_passwd = login_passwd;
	}
}