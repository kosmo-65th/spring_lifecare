package util;

public enum FinalString {
	CALLBACKIP("192.168.219.133");
	
	private String value;
	
	private FinalString(String value) {
		this.value= value;
	}
	
	public String getValue() {
		return value;
	}
}
