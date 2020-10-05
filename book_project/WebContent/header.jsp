<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<header>
  <div class="login_wrap">
    <div class="container">
      <div class="login">
        <ul>
          <li><a href="login.jsp">로그인</a></li>
          <li><a href="#">회원가입</a></li>
          <li><a href="#">출석체크</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="logo col-sm-3">
        <a href="index.jsp"><img src="resources/images/logo.png" /></a>
      </div>
      <!--logo e-->
      <div class="search_bar col-sm-6">
        <form
          class="input-group"
          method="post"
          action="search_result.jsp"
          name="search_bar"
        >
          <input
            type="text"
            name="search_word"
            class="form-control search_word"
          />
          <button
            class="btn btn-default glyphicon glyphicon-search"
            type="button"
            onclick="search_ok()"
          />
        </form>
        <!--input-group end-->
      </div>
    </div>
  </div>
  <!--container e-->
  <div class="menu_wrap">
    <ul class="menu" id="menu">
      <li>
        <a href="#">국내도서</a>
        <ul class="sub">
          <li><a href="#">소설</a></li>
          <li><a href="#">역사</a></li>
          <li><a href="#">정치</a></li>
          <li><a href="#">예술</a></li>
          <li><a href="#">과학</a></li>
        </ul>
      </li>
      <li><a href="#">해외도서</a></li>
      <li><a href="#">E-Book</a></li>
      <li><a href="#">웹소설</a></li>
    </ul>
  </div>
</header>
