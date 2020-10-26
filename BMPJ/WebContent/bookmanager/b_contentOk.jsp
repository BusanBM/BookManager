<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");


		String book_no = request.getParameter("book_no");
		String b_title = request.getParameter("b_title");
		String b_author = request.getParameter("b_author");
		String b_price = request.getParameter("b_price");
		String b_genre = request.getParameter("b_genre");
		String b_year = request.getParameter("b_year");
		String b_amount = request.getParameter("b_amount");
		String b_company = request.getParameter("b_company");

		out.print("도서번호: " + book_no + "<br>");
		out.print("제목: " + b_title + "<br>");
		out.print("작가: " + b_author + "<br>");
		out.print("가격: " + b_price + "<br>");
		out.print("장르: " + b_genre + "<br>");
		out.print("출판년도: " + b_year + "<br>");
		out.print("수량: " + b_amount + "<br>");
		out.print("출판사: " + b_company + "<br>");
	
		try {
			
			String sql = "update BookList set "
						+ " book_no=?, b_title=?, b_author=?, b_price=?, b_genre=?, b_year=?, b_amount=?, b_company=?"
						+ " where book_no=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, book_no);
			pstmt.setString(2, b_title);
			pstmt.setString(3, b_author);
			pstmt.setString(4, b_price);
			pstmt.setString(5, b_genre);
			pstmt.setString(6, b_year);
			pstmt.setString(7, b_amount);
			pstmt.setString(8, b_company);
			pstmt.setString(9, book_no);

			pstmt.executeUpdate();

		} catch (Exception e) {
			out.print("에러가 발생하였습니다.");
			e.printStackTrace();
			
		} finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception e){}
			if(con != null) try { con.close(); } catch(Exception e){}
		}

		response.sendRedirect("b_list.jsp");
	%>
</body>
</html>

