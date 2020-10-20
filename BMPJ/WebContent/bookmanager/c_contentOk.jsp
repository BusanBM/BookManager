<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");


		String cs_no = request.getParameter("cs_no");
		String cs_id = request.getParameter("cs_id");
		String cs_name = HanConv.toKor(request.getParameter("cs_name"));
		String cs_tel = request.getParameter("cs_tel");
		String cs_address = HanConv.toKor(request.getParameter("cs_address"));
		String cs_email = request.getParameter("cs_email");
		String cs_grade = request.getParameter("cs_grade");
		String cs_point = request.getParameter("cs_point");

		out.print("회원번호: " + cs_no + "<br>");
		out.print("아이디: " + cs_id + "<br>");
		out.print("이름: " + cs_name + "<br>");
		out.print("전화번호: " + cs_tel + "<br>");
		out.print("주소: " + cs_address + "<br>");
		out.print("이메일: " + cs_email + "<br>");
		out.print("고객등급: " + cs_grade + "<br>");
		out.print("포인트: " + cs_point + "<br>");
	
		try {
			
			String sql = "update Customer set "
						+ " cs_no=?, cs_id=?, cs_name=?, cs_tel=?, cs_address=?, cs_email=?, cs_grade=?, cs_point=? "
						+ " where cs_no=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, cs_no);
			pstmt.setString(2, cs_id);
			pstmt.setString(3, HanConv.toKor(cs_name));
			pstmt.setString(4, cs_tel);
			pstmt.setString(5, HanConv.toKor(cs_address));
			pstmt.setString(6, cs_email);
			pstmt.setString(7, cs_grade);
			pstmt.setString(8, cs_point);
			pstmt.setString(9, cs_no);
			

			pstmt.executeUpdate();

		} catch (Exception e) {
			out.print("에러가 발생하였습니다.");
			e.printStackTrace();
			
		} finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception e){}
			if(con != null) try { con.close(); } catch(Exception e){}
		}

		response.sendRedirect("c_list.jsp");
	%>
</body>
</html>

