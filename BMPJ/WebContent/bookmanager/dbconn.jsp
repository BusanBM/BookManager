<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc = "jdbc:mysql://192.168.0.152:3306/mydb?useSSL=false&useUnicode=true&characterEncoding=euc-kr";
	String id = "root";
	String passwd = "busanit";

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(jdbc, id, passwd);
	
%>
