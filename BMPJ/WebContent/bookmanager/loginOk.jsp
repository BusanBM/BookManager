<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookManager.*" %>

<% request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
Connection conn = UserDBBean.getMySQLConnection();
	
	String sql = "select * from Customer where cs_id = ?;";
	
	PreparedStatement pstmt =conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs =pstmt.executeQuery();
	rs.next();
	String password = rs.getString("cs_pwd");
	
	UserDBBean.close(rs);
	UserDBBean.close(pstmt);
	UserDBBean.close(conn);
	
	if(password.equals(pwd)){
		%>
		<script>
		alert("환영합니다.");
		location.href="main.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		alert("잘못된 정보입니다.");
		location.href="login.jsp";
		</script>
		<%
	}
%>