package util;

public enum FinalString {
<<<<<<< HEAD
	CALLBACKIP("192.168.219.118");
=======
	CALLBACKIP("192.168.219.125");
>>>>>>> 9532891d9fab96633c50abd55456aa08251b2570
	
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