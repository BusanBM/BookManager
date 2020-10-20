<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@ include file="admin_top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int count = 0;  
	
	String bg; 	
	String sql;	
	
	String ch1 = request.getParameter("ch1");
	String ch2 = request.getParameter("ch2");
	
	
	
	try {
		sql = "select book_no, b_title, b_author, b_price, b_genre, b_img, b_year, b_amount from BookList";

		if(ch2 != null && !ch2.equals("")){		
        
			ch2 = "%" + ch2 + "%";  
			if (ch1.equals("book_no")){
				sql = sql + " where book_no like ? ";
			}else if(ch1.equals("b_title")){
				sql = sql + " where b_title like ?";
			}else if(ch1.equals("b_author")){
				sql = sql + " where b_author like ?";
			}else if(ch1.equals("b_year")){
				sql = sql + " where b_year like ?";
			}		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ch2);
		}		
		else{
			pstmt = con.prepareStatement(sql);
		}
		rs = pstmt.executeQuery();
%>

<section>
	<br>
	<div align="center">
		<h2>도서 정보 관리</h2>
	</div>
	<table align=center width=900 border=1>
		<tr align=center>
	        <th>도서번호</th>
            <th>제목</th>
            <th>작가번호</th>
            <th>가격</th>
            <th>장르</th>
            <th>출판년도</th>
            <th>수량</th>
		</tr>
		<%
			while (rs.next()) {
				count++;
				if (count % 2 == 0) {
					bg = "#e7dddd";
				} else {
					bg = "#aedede";
				}
		%>
		<tr align=center bgcolor=<%=bg%>>
			<td><%=rs.getString("book_no")%></td>
			<td><%=rs.getString("b_title")%></td>
			<td><%=rs.getString("b_author")%></td>
			<td><%=rs.getString("b_price")%></td>
			<td><%=rs.getString("b_genre")%></td>
			<td><%=rs.getString("b_year")%></td>
			<td><%=rs.getString("b_amount")%></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try{ rs.close(); } catch(Exception e){}
				if(pstmt != null) try{ pstmt.close(); } catch(Exception e){}
				if(con != null) try{ con.close(); } catch(Exception e){}
			}
		%>
		<tr align=center>
			<td colspan=8>도서종류: <%=count%>종</td>			
		</tr>
	</table>
	
	<form name=f2 align=center action=b_list.jsp>
		<select name="ch1">
			<option value="book_no">도서번호</option>
			<option value="b_title">제목</option>
			<option value="b_author">작가번호</option>
			<option value="b_year">출판년도</option>
		</select> 
		<input type="text" name="ch2"> 
		<input type="submit" value="검색">
	</form>		
</section>
