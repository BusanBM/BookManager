<%@page import="bookManager.loginCk"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인/회원가입</title>
    <script type="text/javascript" src="resources/js/member.js"></script>
    <link rel="stylesheet" href="resources/css/login.css" />
  </head>
  <body>
    <h2><a href="index.jsp">BooksCode</a></h2>
    <form action="loginOk.jsp" method="post" onsubmit="return loginCk(this)" name=login>
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
              onclick="javascript:window.location='register.jsp'"
            />
          </li>
        </ul>
      </fieldset>
    </form>
  </body>
</html>
