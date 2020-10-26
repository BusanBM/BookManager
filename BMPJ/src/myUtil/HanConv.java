package myUtil;

public class HanConv {
	public static String toKor(String str) {
		if(str==null || str.equals("") || str.equals("null")) {
			return str;
		}
		try {
			return new String(str.getBytes("8859_1"), "euc-kr"); // 8859_1 은 utf-8 / euc-kr 은 utf-16 인코딩 방식
		}catch(Exception e) {									 // 예외처리.
			e.printStackTrace();
			return str;
		} 
	}
}
