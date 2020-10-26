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
		sql = "select B.book_no, B.b_title, B.b_author, B.b_price, B.b_genre, B.b_year,C.comp_name, B.b_amount "
				+"from BookList B join Company C on B.b_company =C.comp_no";
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
			}else if(ch1.equals("comp_name")){
				sql = sql + " where C.comp_name like ?";
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
	<div class="bumle">	
		<table border="1" title="장르 범례">
			<tr>
				<th>소설</th>
				<th>역사</th>
				<th>정치</th>
				<th>예술</th>
				<th>과학</th>
				<th>경제</th>
			</tr>
			<tr>
				<th>01</th>
				<th>02</th>
				<th>03</th>
				<th>04</th>
				<th>05</th>
				<th>06</th>
			</tr>
		</table>
	</div>
	</div>
	
	<table align=center width=900 border=1>
		<tr align=center>
	        <th>도서번호</th>
            <th>제목</th>
            <th>작가</th>
            <th>가격</th>
            <th>장르</th>
            <th>출판년도</th>         
            <th>수량</th>
            <th>출판사</th>
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
			<td>
				<a href='b_content.jsp?book_no=<%=rs.getString("book_no")%>'> <%=rs.getString("book_no")%> </a>
				</td>
			<td><%=rs.getString("b_title")%></td>
			<td><%=rs.getString("b_author")%></td>
			<td><%=rs.getString("b_price")%></td>
			<td><%=rs.getString("b_genre")%></td>
			<td><%=rs.getString("b_year")%></td>	
			<td><%=rs.getInt("b_amount")%></td>	
			<td><%=rs.getString("C.comp_name")%></td>	
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
			<option value="comp_name">출판사</option>
		</select> 
		<input type="text" name="ch2"> 
		<input type="submit" value="검색">
	</form>		
</section>
