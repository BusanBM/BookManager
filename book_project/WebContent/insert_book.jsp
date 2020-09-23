<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록페이지</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/search_result.css" />
<script type="text/javascript" src="./resources/js/book.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <main>
      <div class="jumbotron">
        <div class="container">
          <div class="jumbo_text">도서 정보 입력</div>
        </div>
      </div>
    </main>
    
    <section class="main_input">
    	<div class="container">
    		<form class="form-horizontal" action="insert_book_ok.jsp" method="post" name="form">
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_title">도서명</label>
    				<div class="col-sm-5">
    					<input type="text" maxlength="30" class="form-control" id="b_title" name="b_title" placeholder="도서명">
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_author">저자</label>
    				<div class="col-sm-5">
    					<input type="text" maxlength="30" class="form-control" id="b_author" name="b_author" placeholder="저자">
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_genre">장르</label>
    				<div class="col-sm-5">
    					<select class="form-control" id="b_genre" name="b_genre">
						  <option>시</option>
						  <option>소설</option>
						  <option>비문학</option>
						  <option>참고서</option>
						  <option>잡지</option>
						</select>
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_year">출판년도</label>
    				<div class="col-sm-5">
    					<input type="number" maxlength="4" class="form-control" id="b_year" name="b_year" placeholder="출판년도">
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_price">가격</label>
    				<div class="col-sm-5">
    					<input type="number" maxlength="10" class="form-control" id="b_price" name="b_price" placeholder="가격">
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_list">목차</label>
    				<div class="col-sm-5">
    					<textarea class="form-control" rows="5" name="b_list" id="b_list"></textarea>
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_story">줄거리</label>
    				<div class="col-sm-5">
    					<textarea class="form-control" rows="5" name="b_story" id="b_story"></textarea>
    				</div>
    			</div>
    			<div class="form-group">
    				<label class="col-sm-2 control-label" for="b_story">이미지</label>
    				<div class="col-sm-5">
    					
    				</div>
    			</div>
    			<div class="ok_btn col-sm-7">
    				<button class="btn btn-default" type="button" onclick="insert_ok()">등록</button>
    				<button class="btn btn-default" type="reset">다시입력</button>
    				<button class="btn btn-default" type="button" onclick="location.href='index.jsp'">취소</button>
    			</div>
    		</form>
    	</div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>