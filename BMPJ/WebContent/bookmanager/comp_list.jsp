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
		sql = "select comp_no, comp_name, comp_tel from Company";

		if(ch2 != null && !ch2.equals("")){		
        
	
			if (ch1.equals("comp_no")){
				sql = sql + " where comp_no like ? ";
			}else if(ch1.equals("comp_name")){
				ch2 = "%" + ch2 + "%";
				sql = sql + " where comp_name like ?";
			}else if(ch1.equals("comp_tel")){
				ch2 = "%" + ch2 + "%";
				sql = sql + " where comp_tel like ?";
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
		<h2>출판사 정보 관리</h2>
	</div>
	<table align=center width=800 border=1>
		<tr align=center>
	        <th>회사번호</th>
            <th>회사명</th>
            <th>전화번호</th>
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
			<td><%=rs.getString("comp_no")%></td>
			<td><%=rs.getString("comp_name")%></td>
			<td><%=rs.getString("comp_tel")%></td>
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
			<td colspan=8>출판사 수: <%=count%></td>			
		</tr>
	</table>
	
	<form name=f2 align=center action=comp_list.jsp>
		<select name="ch1">
			<option value="comp_no">회사번호</option>
			<option value="comp_name">회사명</option>
			<option value="comp_tel">전화번호</option>
		</select> 
		<input type="text" name="ch2"> 
		<input type="submit" value="검색">
	</form>		
</section>
