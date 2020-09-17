<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
      <div class="container">
        <div class="row">
          <div class="logo col-sm-3">
            <h1><a href="#"><img src="resources/images/logo.png"></a></h1>
          </div>
          <!--logo e-->
          <div class="search_bar col-sm-5">
            <form class="input-group" method="post" action="search_result.jsp" name="search_bar">
              <input type="text" name="search_word" class="form-control" />
              <span class="input-group-btn">
              <button
                  class="btn btn-default glyphicon glyphicon-search"
                  type="button"
                  onclick="search_ok()">
              </button>
              </span>
            </form>
            <!--input-group end-->
          </div>
          <div class="login_btn col-sm-3">
            <a href="#" class="btn btn-default" role="button">로그인</a>
            <a href="#" class="btn btn-default" role="button">회원가입</a>
          </div>
        </div>
      </div>
      <!--container e-->
    </header>