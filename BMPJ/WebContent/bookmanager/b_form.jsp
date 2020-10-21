<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
<section>
	<br>
	<form name="f1" action="b_formOk.jsp" onSubmit="return functionK();"
		method="GET">
		<div align="center">
			<h2>도서 정보 입력</h2>
		</div>
		<table border="1" align=center width=350 heignt=100>
			<tr>
				<td align=center>도서번호</td>
				<td><input type=text name=book_no></td>
			</tr>
			<tr>
				<td align=center>제목</td>
				<td><input type=text name=b_title></td>
			</tr>
			<tr>
				<td align=center>작가</td>
				<td><input type=text name=b_author></td>
			</tr>
			<tr>
				<td align=center>가격</td>
				<td><input type=text name=b_price></td>
			</tr>
			<tr>
				<td align=center>장르</td>
				<td><input type=text name=b_genre></td>
			</tr>
			<tr>
				<td align=center>출판년도</td>
				<td><input type=text name=b_year></td>
			</tr>
			<tr>
				<td align=center>수량</td>
				<td><input type=text name=b_amount></td>
			</tr>			
			<tr>
				<td align=center colspan=2><input type=submit value="도서등록">
				</td>
			</tr>
		</table>
	</form>
</section>
