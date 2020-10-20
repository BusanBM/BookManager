<%@page import="bookManager.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인/회원가입</title>
    <script type="text/javascript" src="script.js"></script>
    <link rel="stylesheet" href="css/login.css" />
  </head>
  <body>
  <%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pwd");
	
	if(loginCk.pass(id, password)){
		session.setAttribute("id", id);
		session.setAttribute("login", "yes");
	}
	String logout = request.getParameter("logout");
	if(logout != null && logout.equals("yes")){
		session.removeAttribute("id");
		session.removeAttribute("login");
	}
	String login = (String)session.getAttribute("login");
	ManagerCheck mCk = new ManagerCheck();
	mCk.setGrade(id);
	if(login != null&& login.equals("yes")){
		if("A".equals(mCk.getGrade())){
			/* response.sendRedirect("../main.jsp"); */
			%>
			<script>
			alert("관리자님 환영합니다^^.");
			location.href="main.jsp";
			</script>
			<%
		}else{
			%>
			<script>
			alert("로그인 되었습니다.환영합니다^^.");
			location.href="main.jsp";
			</script>
			<%
		}
	}else{
		%>

    <h2><a href="index.jsp">BooksCode</a></h2>
    <form action="?" method="post" onsubmit="return loginCk(this)" name=login>
      <fieldset>
        <legend>로그인</legend>
        <ul>
          <li>
            <input
            name ="id"
              type="text"
              size="15"
              placeholder="아이디 입력"
              onfocus="this.placeholder=''"
              onblur="this.placeholder='아이디 입력'"
            />
          </li>
          <li>
            <input
            name="pwd"
              type="password"
              size="15"
              placeholder="비밀번호 입력"
              onfocus="this.placeholder=''"
              onblur="this.placeholder='비밀번호 입력'"
            />
          </li>
          <li>
            <input class="btn_login" type="submit" value="로그인" />
            <input
              class="btn_register"
              type="button"
              value="회원가입"
              onclick="javascript:window.location='register.html'"
            />
          </li>
        </ul>
      </fieldset>
    </form>
    <%
    }
	%>
  </body>
</html>
