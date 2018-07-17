package net.e4net.s1.main.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.e4net.eiwaf.common.AbstractVO;

/**
 * 濡쒓렇�씤 DataVO.
 * @author E4NET
 * @version 1.0
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class LoginDVO extends AbstractVO  {

	private static final long serialVersionUID = -850700320290647312L;

	private String user_id;			//�궗�슜�옄�븘�씠�뵒
	private String name;			//�궗�슜�옄紐�
	private String grp_cl;			//洹몃９肄붾뱶
	private String user_status;		//�궗�슜�옄�긽�깭
	private String login_passwd;	//濡쒓렇�씤�뙣�뒪�썙�뱶
	private int fail_count;			//濡쒓렇�씤�떎�뙣�슏�닔
	private String login_ip;		//濡쒓렇�씤�븘�씠�뵾

	public String getUser_id() {
		return user_id;
	}
	public String getName() {
		return name;
	}
	public String getGrp_cl() {
		return grp_cl;
	}
	public String getUser_status() {
		return user_status;
	}
	public String getLogin_passwd() {
		return login_passwd;
	}
	public int getFail_count() {
		return fail_count;
	}
	public String getLogin_ip() {
		return login_ip;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGrp_cl(String grp_cl) {
		this.grp_cl = grp_cl;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public void setLogin_passwd(String login_passwd) {
		this.login_passwd = login_passwd;
	}
	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}
	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}
	
}