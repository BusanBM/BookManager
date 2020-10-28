<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>홈페이지</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/css/book_project.css"/>
    <script type="text/javascript" src="resources/js/book.js"></script>
  </head>
  <body>
<%
  	String logout = request.getParameter("logout");
	String id = (String)session.getAttribute("id");
   	if((logout == null && !"yes".equals(logout))&&id !=null){
	      %>
	      <jsp:include page="header_login.jsp"></jsp:include>
	      <%
	}else{
		      session.removeAttribute("id");
		      session.removeAttribute("login");
	      %>
	      <jsp:include page="header.jsp"></jsp:include>
	      <%
	   }
	%>
	    
	    <main>
	        <div id="slide">
	           <input type="radio" name="pos" id="pos1" checked>
	           <input type="radio" name="pos" id="pos2">
	           <input type="radio" name="pos" id="pos3">
	           <input type="radio" name="pos" id="pos4">
	           <ul>
	             <li><div class="container main_slide"><img src="resources/images/main01.jpg"></div></li>
	             <li><div class="container main_slide"><img src="resources/images/main02.jpg"></div></li>
	             <li><div class="container main_slide"><img src="resources/images/main03.jpg"></div></li>
	             <li><div class="container main_slide"><img src="resources/images/main04.jpg"></div></li>
	           </ul>
	            <p class="pos">
	             <label for="pos1"></label>
	             <label for="pos2"></label>
	             <label for="pos3"></label>
	             <label for="pos4"></label>
	           </p>
	        </div>
	    </main>
	
	    <section>
	      <div class="container">
	        <h3>오늘의 책</h3>
	         <div class="book_display_1">
	             <a href="http://localhost:8081/BMPJ/bookmanager/detail_book.jsp?book_no=2117070401">
	             <p><img src="resources/images/2117070401.jpg"/></p>
	             <dl>
	               <dt>해리포터1</dt>
	             </dl>
	             <dl>
	               <dd>J.K.롤링</dd>
	             </dl>
	            </a>
	         </div>
	      </div>
	    </section>
	
	    <section class="best_seller">
	      <div class="container">
	        <h3>베스트셀러</h3>
	        <div class="book_display_2">
	          <div class="book_display_2_1">
	             <a href="http://localhost:8081/BMPJ/bookmanager/detail_book.jsp?book_no=1201080101">
	             <p><img src="resources/images/1201080101.jpg"/></p>
	             <dl>
	               <dt>난중일기</dt>
	             </dl>
	             <dl>
	               <dd>이순신</dd>
	             </dl>
	            </a>
	          </div>
	          <div class="book_display_2_1">
	          <a href="http://localhost:8081/BMPJ/bookmanager/detail_book.jsp?book_no=1208050501">
	           <p><img src="resources/images/1208050501.jpg"/></p>
	             <dl>
	               <dt>나의문화유산답사기</dt>
	             </dl>
	             <dl>
	               <dd>유홍준</dd>
	             </dl>
	            </a>
	          </div>
	          <div class="book_display_2_1">
	             <a href="http://localhost:8081/BMPJ/bookmanager/detail_book.jsp?book_no=1208050501">
	              <p><img src="resources/images/1415040201.jpg"/></p>
	              <dl>
	                <dt>예술하는습관</dt>
	              </dl>
	              <dl>
	                <dd>메이슨</dd>
	              </dl>
	            </a>
	          </div>
	          <div class="book_display_2_1">
	            <a href="http://localhost:8081/BMPJ/bookmanager/detail_book.jsp?book_no=2103010101">
	              <p><img src="resources/images/2103010101.jpg" /></p>
	              <dl>
	                <dt>어린왕자</dt>
	              </dl>
	              <dl>
	                <dd>생텍쥐페리</dd>
	              </dl>
	            </a>
	          </div>
	        </div>
	      </div>
	    </section>
	    <jsp:include page="footer.jsp"></jsp:include>
	  </body>
	</html>