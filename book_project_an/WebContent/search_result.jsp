<%@page import="book_project.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book_project.BookDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String search_word = request.getParameter("search_word");
	
	BookDBBean db = BookDBBean.getinstance();
	ArrayList<BookBean> listBook =  db.listBoard(search_word);
	String b_author, b_genre, b_title, b_list, b_story;
	int b_price=0 , b_year=0;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>검색결과</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/css/search_result.css" />
    <script type="text/javascript" src="resources/js/book.js"></script>
  </head>
  
  <body>
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

    <main>
      <div class="jumbotron">
        <div class="container">
          <div class="result_text"><%=search_word%>에 대한 검색결과 입니다.</div>
        </div>
      </div>
    </main>
    
    <section class="main_result">
      <div class="container">
        <table class="table">
          <thead>
            <tr>
              <th>책 내용</th>
              <th>가격</th>
              <th>참고</th>
            </tr>
          </thead>
          <tbody>
<%
    	for(int i=0; i<listBook.size(); i++){
    		BookBean book = listBook.get(i);
    		b_title = book.getB_title();
    		b_author = book.getB_author();
    		b_genre = book.getB_genre();
    		b_list = book.getB_list();
    		b_story = book.getB_story();
    		b_price = book.getB_price();
    		b_year = book.getB_year();
%>
            <tr>
              <td>
                <div class="col-sm-3">
                  <img src="..." class="img-thumbnail" />
                </div>
                <div class="col-sm-7">
                  <div class="title"><a href="#"><%=b_title %></a></div>
                  <div class="detail_desc">
                    <div><%=b_author %></div>
                    &nbsp;
                    <div><%=b_genre %></div>
                    &nbsp;
                    <div><%=b_year %></div>
                  </div>
                </div>
              </td>
              <td><%=b_price%>원</td>
              <td>
                <a href="#" class="btn btn-primary" role="button">상세보기</a>
              </td>
            </tr>
<%
	}
%>
          </tbody>
        </table>
      </div>
    </section>
    <footer>
      <div class="container">
        <div class="col-sm-2">
          <h3><a href="#">LOGO</a></h3>
        </div>
        <div class="footer_text col-sm-4">
          주소 : 부산광역시 해운대구 해운대로 81번가길 63<br>
          전화번호 : 051-000-0000<br>
          fax : 051-000-0000
        </div>
        <div class="col-sm-5">
          링크 <br>
          <button class="button"><img src="resources/images/logo_kyobo.png"></button>
        </div>
      </div>
    </footer>
  </body>
</html>