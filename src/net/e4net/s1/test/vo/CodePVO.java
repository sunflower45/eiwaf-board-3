package net.e4net.s1.test.vo;

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
public class CodePVO extends AbstractVO {

	private static final long serialVersionUID = 7550500779801705095L;

	private String key;
	private String key1;
	private String key2;
	private String key3;
	private String key4;
	private String key5;

	public String getKey() {
		return key;
	}
	public String getKey1() {
		return key1;
	}
	public String getKey2() {
		return key2;
	}
	public String getKey3() {
		return key3;
	}
	public String getKey4() {
		return key4;
	}
	public String getKey5() {
		return key5;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public void setKey1(String key1) {
		this.key1 = key1;
	}
	public void setKey2(String key2) {
		this.key2 = key2;
	}
	public void setKey3(String key3) {
		this.key3 = key3;
	}
	public void setKey4(String key4) {
		this.key4 = key4;
	}
	public void setKey5(String key5) {
		this.key5 = key5;
	}
	
}