package util;

public enum FinalString {
	CALLBACKIP("192.168.219.124");
	
	private String value;
	
	private FinalString(String value) {
		this.value= value;
	}
	
	public String getValue() {
		return value;
	}
}


/*
JSP 내 소스 구동 순서 
JAVA>JSTL>HTML>Javascript 
*/