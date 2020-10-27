<%@page import="book_project.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String search_word = request.getParameter("search_word");
	String search_genre = request.getParameter("search_genre");
	int genre = 0;
			
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null){
		currentPage = "1";
	}
	
	BookDBBean db = BookDBBean.getinstance();
	ArrayList<BookBean> listBook = null;
	if(search_word != null){
		listBook  = db.listBoard(search_word,currentPage);
	}else if(search_genre != null){
		genre = Integer.parseInt(search_genre); 
		listBook =  db.genreBoard(genre,currentPage);
	}
	
	String b_author, b_genre, b_title, b_list, b_story;
	int b_price=0 , b_year=0, b_no=0;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>검색결과</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/css/book_project.css" />
    <script type="text/javascript" src="resources/js/book.js"></script>
  </head>
  
  <body>
<%
	String logout = request.getParameter("logout");
	if(logout != null && logout.equals("yes")){
		session.removeAttribute("id");
		session.removeAttribute("login");
		%>
		<jsp:include page="header.jsp"></jsp:include>
		<%
	}else{
		%>
		<jsp:include page="header_login.jsp"></jsp:include>
		<%
	}
%>
    <main>
      <div class="jumbotron">
        <div class="container">
          <div class="jumbo_text">
          	<% 
          		if(search_word != null){
        	%>
        	  	<%=search_word%>에 대한 검색결과 입니다.
        	<%
          		}else if(search_genre != null){
          			String strGenre="";
          			switch(genre){
          			case 01: strGenre="소설"; break;
          			case 02: strGenre="역사"; break;
          			case 03: strGenre="정치"; break;
          			case 04: strGenre="예술"; break;
          			case 05: strGenre="과학"; break;
          			}
        	%>
        	  	<%=strGenre%>카테고리 검색결과 입니다.
        	<%
          		}
        	%>
          </div>
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
    		b_no = book.getB_no();
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
                  <div class="title"><%=b_title %></div>
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
                <a href="detail_book.jsp?book_no=<%=b_no%>" class="btn btn-primary" role="button">상세보기</a>
              </td>
            </tr>
<%
	}
%>
          </tbody>
        </table>
        <div class="paging_list" align="center">		
			<%= BookBean.pageNumber(5, search_word) %>
		</div>
      </div>
    </section>
  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>