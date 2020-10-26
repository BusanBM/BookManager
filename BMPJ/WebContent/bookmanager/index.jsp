<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ȩ������</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/css/book_project.css"/>
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
      <div class="jumbotron main_visual">
        <div class="container">
          <div></div>
        </div>
      </div>
    </main>

    <section>
      <div class="container">
        <h3>������ å</h3>
        <div class="book_display_1">
          <p><img src="resources/images/2103010101.jpg" /></p>
          <dl>
            <dt>�����</dt>
          </dl>
          <dl>
            <dd>�������丮</dd>
          </dl>
        </div>
      </div>
    </section>

    <section class="best_seller">
      <div class="container">
        <h3>����Ʈ����</h3>
        <div class="book_display_2">
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>�����</dt>
            </dl>
            <dl>
              <dd>�������丮</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>�����</dt>
            </dl>
            <dl>
              <dd>�������丮</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>�����</dt>
            </dl>
            <dl>
              <dd>�������丮</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>�����</dt>
            </dl>
            <dl>
              <dd>�������丮</dd>
            </dl>
          </div>
        </div>
      </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
