<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="admin_top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	String book_no = request.getParameter("book_no");

	String sql = "select book_no, b_title, b_author, b_price, b_genre, b_year, b_amount from BookList where book_no=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, book_no);
	rs = pstmt.executeQuery();
	rs.next();
%>
<section>
	<br>	
	<form name="f1" action="b_contentOk.jsp" method="GET">
		<div align="center">
			<h2>도서 정보 수정</h2>
		</div>
		
		
		
		<table border="1" align=center width=350 heignt=100>

			<tr>
		        <td align="center">도서번호</td>
		        <td><input type=hidden name=book_no value=<%=rs.getString("book_no")%>><%=rs.getString("book_no")%></td>
		    </tr>
			<tr>
	            <td align="center">제&emsp;목</td>
	            <td><input type=text name=b_title value=<%=rs.getString("b_title")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">작&emsp;가</td>
	            <td><input type=text name=b_author value=<%=rs.getString("b_author")%>></td>
		    </tr>

			<tr>
	            <td align="center">가&emsp;격</td>
	            <td><input type=text name=b_price value=<%=rs.getString("b_price")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">장&emsp;르</td>
	            <td><input type=text name=b_genre value=<%=rs.getString("b_genre")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">출판년도</td>
	            <td><input type=text name=b_year value=<%=rs.getString("b_year")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">수&emsp;량</td>
	            <td><input type=text name=b_amount value=<%=rs.getString("b_amount")%>></td>
		    </tr>	            
	            
			<tr>
				<td align=center colspan=2><input type=submit value="정보저장">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<hr width=80% />
	<div align=center>
 
		[<a href='b_list.jsp'>목록보기</a>]
		[<a	href='b_delete.jsp?book_no=<%=rs.getString("book_no")%>'>삭제하기</a>] 
	</div>
</section>
<%
	if(con != null) try { con.close(); } catch(Exception e){}
	if(rs != null) try { rs.close(); } catch(Exception e){}
	if(pstmt != null) try { pstmt.close(); } catch(Exception e){}
%>

