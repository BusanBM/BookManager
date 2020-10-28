<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookManager.*" %>

<% 
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	UserDBBean db = UserDBBean.getinstance();
	UserBean user = db.getUser(id);
	int check = db.userCheck(id, pwd);
	
	//id가 존재하지 않음.
	if(user == null){
%>
		<script>
			alert("존재하지 않는 회원입니다.");
			history.back();
		</script>
		
<%
	//id에 맞는 멤버는 있다.
	}else{ 
		String name = user.getCs_name();
		String grade = user.getCs_grade();
		
		if(check == 1){ //id에 맞는 pw가 일치 
			if(grade.equalsIgnoreCase("A")){
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("Member", "admin");
			}else{
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("Member", "yes");
			}
			response.sendRedirect("index.jsp");
		}else if(check == 0){	//id에 맞는 pw가 불일치
%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.");
				history.go(-1); //(=history.back();)
			</script>
		
<%
		}else{
%>
			<script type="text/javascript">
				alret("로그인 오류");
				history.go(-1);
			</script>
<%		
		}
	}		
%>