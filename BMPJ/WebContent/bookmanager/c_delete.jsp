<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	
	String cs_no = request.getParameter("cs_no");
	try{

			String sql = "delete from Customer where cs_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cs_no);
			pstmt.executeUpdate();


			if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
			if (con != null) try { con.close();} catch (Exception e) {}		

			response.sendRedirect("c_list.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
		if (con != null) try { con.close();} catch (Exception e) {}
	}
%>

