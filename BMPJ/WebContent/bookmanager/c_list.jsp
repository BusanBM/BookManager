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
		sql = "select cs_no, cs_id, cs_pwd, cs_name, cs_tel, cs_address, cs_email, cs_grade, cs_point from Customer";

		if(ch2 != null && !ch2.equals("")){		
        
	
			if (ch1.equals("cs_no")){
				sql = sql + " where cs_no like ? ";
			}else if(ch1.equals("cs_id")){
				ch2 = "%" + ch2 + "%";
				sql = sql + " where cs_id like ?";
			}else if(ch1.equals("cs_name")){
				ch2 = "%" + ch2 + "%";
				sql = sql + " where cs_name like ?";
			}else if(ch1.equals("cs_tel")){
				ch2 = "%" + ch2 + "%";
				sql = sql + " where cs_tel like ?";
			}else if(ch1.equals("cs_grade")){
				sql = sql + " where cs_grade like ?";
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
		<h2>고객 정보 관리</h2>
	</div>
	<table align=center width=1000 border=1>
		<tr align=center>
	        <th>고객번호</th>
            <th>고객ID</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>이메일</th>
            <th>고객등급</th>
            <th>포인트</th>
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
				<a href='c_content.jsp?cs_no=<%=rs.getString("cs_no")%>'> <%=rs.getString("cs_no")%> </a>
			</td>
			<td><%=rs.getString("cs_id")%></td>
			<td><%=rs.getString("cs_name")%></td>
			<td><%=rs.getString("cs_tel")%></td>
			<td><%=rs.getString("cs_address")%></td>
			<td><%=rs.getString("cs_email")%></td>
			<td><%=rs.getString("cs_grade")%></td>
			<td><%=rs.getInt("cs_point")%></td>
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
			<td colspan=8>고객수: <%=count%></td>			
		</tr>
	</table>
	
	<form name=f2 align=center action=c_list.jsp>
		<select name="ch1">
			<option value="cs_no">고객번호</option>
			<option value="cs_id">아이디</option>
			<option value="cs_name">이름</option>
			<option value="cs_tel">전화번호</option>
			<option value="cs_grade">고객 등급</option>
		</select> 
		<input type="text" name="ch2"> 
		<input type="submit" value="검색">
	</form>		
</section>
