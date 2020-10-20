<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="bookManager.*" %>

<%
   	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	Connection conn = UserDBBean.getMySQLConnection();
	
	String sql = "insert into Customer(cs_id,cs_pwd,cs_name,cs_tel,cs_addres,cs_email) values(?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2,password);
	pstmt.setString(3, name);
	pstmt.setString(4, tel);
	pstmt.setString(5, addr);
	pstmt.setString(6, email);
	pstmt.executeUpdate();
	
	UserDBBean.close(pstmt);
	UserDBBean.close(conn);
%>
