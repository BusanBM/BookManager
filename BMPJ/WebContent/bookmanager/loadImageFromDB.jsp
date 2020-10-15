<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,java.sql.*,java.io.*"  %>
<% 
	String sql = "";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	out.clear();
	out=pageContext.pushBody();
	
	OutputStream output = response.getOutputStream();
	InputStream input = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://192.168.0.151:3306/mydb";
		String id = "root";
		String pwd = "busanit";
		
		con=DriverManager.getConnection(url, id, pwd);
		
		Statement stmt = con.createStatement();
		
		sql = "select file from tbl_test where id=5	";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			System.out.println("logo");
			input = rs.getBinaryStream("file");
			int byteRead;
			while((byteRead = input.read()) != -1){
				output.write(byteRead);
			}
			input.close();
		}
	}catch(Exception e){
		out.println(e);
	}finally{
		try{if(rs !=null)rs.close();}catch(Exception ex){}
		try{if(pstmt !=null)pstmt.close();}catch(Exception ex){}
		try{if(con !=null)con.close();}catch(Exception ex){}
	}
	input.close();
	output.flush();
	output.close();
%>