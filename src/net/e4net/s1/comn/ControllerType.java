package net.e4net.s1.comn;

/**
 * Controller 타입.
 * @author E4NET
 * @version 1.0
 */
public enum ControllerType {

	/** 비로그인(공용) 컨트롤러 */
	PUBLIC,
	/** 로그인 컨트롤러 */
	LOGIN,
	/** 권한 컨트롤러 */
	AUTH;

	public boolean equalsType(String type) {
		return this.toString().equalsIgnoreCase(type);
	}

}