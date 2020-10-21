<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	
	String book_no = request.getParameter("book_no");
	try{

			String sql = "delete from BookList where book_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, book_no);
			pstmt.executeUpdate();


			if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
			if (con != null) try { con.close();} catch (Exception e) {}		

			response.sendRedirect("b_list.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
		if (con != null) try { con.close();} catch (Exception e) {}
	}
%>

