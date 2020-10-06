<%@page import="book_project.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book_project.BookDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어를 utf-8로 인코딩하여 받는다.
	request.setCharacterEncoding("utf-8");
	//검색어를 변수 search_word에 넣는다.
	String search_word = request.getParameter("search_word");
	
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null){
		currentPage = "1";
	}
	
	//BookDBBean을 이용하기 위해 인스턴스를 생성한다.
	BookDBBean db = BookDBBean.getinstance();
	//listBoard()메소드로 db에 저장된 책 목록을 가져온다.
	ArrayList<BookBean> listBook =  db.listBoard(search_word,currentPage);
	
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
    <link rel="stylesheet" href="resources/css/search_result.css" />
    <script type="text/javascript" src="resources/js/book.js"></script>
  </head>
  
  <body>
  <!-- header.jsp로 향한다. -->
  <jsp:include page="header.jsp"></jsp:include>
  
  <!-- 검색결과를 나타낸다. (추후, 검색결과가 없을때 '검색결과 없음'이 생성되게 변경) -->
    <main>
      <div class="jumbotron">
        <div class="container">
          <div class="jumbo_text"><%=search_word%>에 대한 검색결과 입니다.</div>
        </div>
      </div>
    </main>
    
  <!-- 책 목록을 보여줄 부분 -->
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
              <!-- 책의 상세 내용 볼 수 있게 표현 -->
                <a href="detail_book.jsp?b_no=<%=b_no%>" class="btn btn-primary" role="button">상세보기</a>
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

    
    <!-- footer.jsp로 향한다. -->
  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>