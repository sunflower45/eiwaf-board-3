package net.e4net.s1.test.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import net.e4net.eiwaf.web.util.page.PageVO;

/**
 * �궗�슜�옄 紐⑸줉議고쉶 DataVO.
 * @author E4NET
 * @version 1.0
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class UserDVO extends PageVO {

	private static final long serialVersionUID = -738415059274010232L;

	private String user_id;		//�궗�슜�옄�븘�씠�뵒
	private String name;		//�궗�슜�옄紐�
	private String grp_cl;		//洹몃９肄붾뱶
	private String user_status;	//�궗�슜�옄�긽�깭
	private String login_dt;		//媛��엯�씪�옄

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
	public String getLogin_dt() {
		return login_dt;
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
	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}
}