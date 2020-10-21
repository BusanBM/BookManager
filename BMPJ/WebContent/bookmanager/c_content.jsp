<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="admin_top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	String cs_no = request.getParameter("cs_no");

	String sql = "select cs_no, cs_id, cs_name, cs_tel, cs_address, cs_email, cs_grade, cs_point from Customer where cs_no=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, cs_no);
	rs = pstmt.executeQuery();
	rs.next();
%>
<section>
	<br>	
	<form name="f1" action="c_contentOk.jsp">
		<div align="center">
			<h2>고객 정보 수정</h2>
		</div>
		
		
		
		<table border="1" align=center width=350 heignt=100>

			<tr>
		        <td align="center">고객번호</td>
		        <td><input type=hidden name=cs_no value=<%=rs.getString("cs_no")%>><%=rs.getString("cs_no")%></td>
		    </tr>
			<tr>
	            <td align="center">고객ID</td>
	            <td><input type=text name=cs_id value=<%=rs.getString("cs_id")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">이&emsp;름</td>
	            <td><input type=text name="cs_name" value=<%=rs.getString("cs_name")%>></td>
		    </tr>

			<tr>
	            <td align="center">전화번호</td>
	            <td><input type=text name=cs_tel value=<%=rs.getString("cs_tel")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">주&emsp;소</td>
	            <td><input type=text name=cs_address value=<%=rs.getString("cs_address")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">이메일</td>
	            <td><input type=text name=cs_email value=<%=rs.getString("cs_email")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">고객등급</td>
	            <td><input type=text name=cs_grade value=<%=rs.getString("cs_grade")%>></td>
		    </tr>	            
	            
			<tr>	            
	            <td align="center">포인트</td>
	            <td><input type=text name=cs_point value=<%=rs.getString("cs_point")%>></td>
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
 
		[<a href='c_list.jsp'>목록보기</a>] 
		[<a	href='c_delete.jsp?cs_no=<%=rs.getString("cs_no")%>'>삭제하기</a>]

	</div>
</section>
<%
	if(con != null) try { con.close(); } catch(Exception e){}
	if(rs != null) try { rs.close(); } catch(Exception e){}
	if(pstmt != null) try { pstmt.close(); } catch(Exception e){}
%>

