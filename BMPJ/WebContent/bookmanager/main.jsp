<%@page import="bookManager.ManagerCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈페이지</title>
    <link rel="stylesheet" href="./resources/css/main.css">
    <script type="text/javascript" src="resources/js/book.js"></script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="login_wrap">
                <div class="login">
                    <ul>
                        <li><%
                       		request.setCharacterEncoding("UTF-8");
							String id = (String)session.getAttribute("id");
							ManagerCheck mCk=new ManagerCheck();
							mCk.setGrade(id);
							%>
							<p> 안녕하세요! <%=id %>님. <%= mCk.getGrade() %></p></li>
						<li>
							<input type="button" value="로그아웃" onclick="location.href='index.jsp?logout=yes'">
						</li>
						<li>
						<% 
							if("A".equals(mCk.getGrade())){ %>
								<input type="button" value="관리자 페이지로 이동" onclick="location.href='#'">
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
            <div class="search_area">
                <h1>LOGO</h1>
                <table class="search_table">
                    <tr>
                        <td><input type="text" class="search"></td>
                        <td><input type="button" class="search_btn" onclick="search_ok()"></td>
                    </tr>
                </table>
            </div>
            <div class="menu_wrap">
                <ul class="menu" id="menu">
                    <li><a href="#">국내도서</a>
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
        </div>
        <!-- header End -->
        <div class="content_wrap">
            <div class="content_name">
                <h2 class="todays_book_text">오늘의 책</h2>
                <h2 class="bestseller_text">베스트 셀러</h2>
            </div>
            <div class="todays_book_wrap">
                <div class="todays_book">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- todays_book End -->
            </div>
            <div class="bestseller_wrap">
                <div class="bestseller">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- bestseller End -->
            </div>
            <!-- bestseller_wrap End -->
            <div class="bookList_wrap">
                <div class="book1" id="booklis">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- book1 End -->
                <div class="book2" id="booklis">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- book2 End -->
                <div class="book3" id="booklis">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- book3 End -->
                <div class="book4" id="booklis">
                    <p><img src="img/어린왕자.PNG" alt="어린왕자"></p>
                    <dl>
                        <dt>TITLE</dt>
                        <dd>
                            어린왕자
                        </dd>
                        <dt>AUTHOR</dt>
                        <dd>
                            생텍쥐페리
                        </dd>
                    </dl>
                </div>
                <!-- book4 End -->
            </div>
            <!-- bookList_wrap End -->
        </div>
        <!-- content_wrap End -->
        <div class="footer">
            <div class="footer_text">
                <p>
                    부산광역시 수영구 수영로 223길 23<span>대표 김민규</span>
                    <span><a href="tel:010-9996-1822">TEL.010-9996-1822</a></span>
                </p>
                <p>
                    BooksCode. All Right Reserved. Design by 북스코드
                </p>
            </div>
        </div>
        <!-- footer End -->
    </div>
</body>
</html>
