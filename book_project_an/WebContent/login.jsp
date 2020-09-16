<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 페이지입니다.</title>
</head>
<body>
	<
	<form action="loginOK.jsp" method="post">
		<table border="1" align="center">
			<tr height="30">
				<td width="100" align="center">사용자 ID</td>
				<td><input type="text" name="mem_uid" size="20"></td>
			</tr>
			<tr>
				<td width="100" align="center">비밀번호</td>
				<td><input type="password" name="mem_pwd" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="로 그 인">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				<!-- onclick="location.href='register.jsp'" -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>