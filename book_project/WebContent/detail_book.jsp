<%@page import="book_project.BookBean"%>
<%@page import="book_project.BookDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	BookDBBean db = BookDBBean.getinstance();
	BookBean book = db.getBook(b_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 정보</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/search_result.css" />
</head>
<body>
<main>
      <div class="jumbotron">
        <div class="container">
          <div class="jumbo_text">상세 도서 정보</div>
        </div>
      </div>
    </main>
    <section>
      <div class="container">
        <div class="book_image"><img src="#" /></div>
        <div class="detail_cont">
          <div class="detail_header">
            <h1>받을 제목</h1>
            <div>작가</div>
            <div>장르</div>
            <div>발행년도</div>
            <div class="detail_price">판매가</div>
          </div>
          <div class="detail_buy">
            <div>주문수량 <input type="number" name="b_quantity" /></div>
            <button class="btn btn-primary" type="button">장바구니 담기</button>
            <button class="btn btn-default" type="button">바로구매</button>
          </div>
        </div>
      </div>
    </section>
    <section>
      <div class="container">
        <div class="detail">
          <div class="b_story">스토리</div>
          <div class="b_list">목차</div>
        </div>
      </div>
    </section>
</body>
</html>