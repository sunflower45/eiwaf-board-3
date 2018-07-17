package net.e4net.s1.comn;


public enum StatusType {

	/** BIZException */
	USER_1000(-1000)
	;

	private int code;

	private StatusType(int code) {
		this.code = code;
	}

	public boolean equalsType(String name) {
		return this.toString().equalsIgnoreCase(name);
	}

	public boolean equalsType(int code) {
		return this.code == code;
	}

	public int getCode() {
		return code;
	}

}