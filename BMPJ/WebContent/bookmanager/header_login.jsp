<%@page import="bookManager.ManagerCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<header>
  <div class="login_wrap">
    <div class="container">
      <div class="login">
        <ul>
          	<li><%
              	request.setCharacterEncoding("UTF-8");
				String id = (String)session.getAttribute("id");
				ManagerCheck mCk=new ManagerCheck();
				mCk.setGrade(id);
				%>
				<p> 안녕하세요! <%=id %>님. 등급 :<%= mCk.getGrade() %></p></li>
		  	<li>
				<input type="button" value="로그아웃" onclick="location.href='index.jsp?logout=yes'">
			</li>
		  	<li>
			<% 
				if("A".equals(mCk.getGrade())){ %>
					<input type="button" value="관리자 페이지로 이동" onclick="location.href='admin_index.jsp'">
					<input type="button" value="회원정보수정" onclick="location.href='#'" disabled="disabled" style="display:none;">
				<%
				}else{ %>
					<input type="button" value="관리자 페이지로 이동" onclick="location.href='#'" disabled="disabled" style="display:none;">
					<input type="button" value="회원정보수정" onclick="location.href='#'">
					<%}
			%>
			</li>
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
          name="search_bar">
          <input
            type="text"
            name="search_word"
            class="form-control search_word"/>
          <button
            class="btn btn-default glyphicon glyphicon-search"
            type="button"
            onclick="search_ok()">
          </button>
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
          <li><a href="search_result.jsp?search_genre=01">소설</a></li>
          <li><a href="search_result.jsp?search_genre=02">역사</a></li>
          <li><a href="search_result.jsp?search_genre=03">정치</a></li>
          <li><a href="search_result.jsp?search_genre=04">예술</a></li>
          <li><a href="search_result.jsp?search_genre=05">과학</a></li>
        </ul>
      </li>
      <li>
      	<a href="#">해외도서</a>
        <ul class="sub">
          <li><a href="search_result.jsp?search_genre=01">소설</a></li>
          <li><a href="search_result.jsp?search_genre=02">역사</a></li>
          <li><a href="search_result.jsp?search_genre=03">정치</a></li>
          <li><a href="search_result.jsp?search_genre=04">예술</a></li>
          <li><a href="search_result.jsp?search_genre=05">과학</a></li>
        </ul>
      </li>
      <li><a href="#">E-Book</a></li>
      <li><a href="#">웹소설</a></li>
    </ul>
  </div>
</header>
