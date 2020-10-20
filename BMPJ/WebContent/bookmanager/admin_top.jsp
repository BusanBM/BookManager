<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서점 정보 관리</title>
<style>
header {
	background-color: blue;
	text-align: center;
	height: 45px;
	font-size: 18px;
	color: #ffffff;
	line-height: 45px;
	vertical-align: middle;
}

nav {
	background-color: #6699ff;
	height: 50px;
	width: 100%;
	font-size: 14px;
	display: table;
	text-align: left;
}

section {
	background-color: #cccccc;
	height: 850px;
	font-size: 12px;
	width: 100%
}

footer {
	background-color: #6699ff;
	text-align: center;
	height: 35px;
	font-size: 12px;
	color: #ffffff;
	line-height: 35px;
}

table {	
	border-collapse: collapse;
}

td {
	border: 1px solid #555555;	
}

#span1 {
	background-color: #6699ff;
	width: 300px;
	display: table-cell;
	vertical-align: middle;
}

A:link {
	color: #555555;
	text-decoration: none;
}

A:visited {
	color: #555555;
	text-decoration: none;
}

A:active {
	color: #555555;
	text-decoration: none;
}

A:hover {
	color: #000000;
	font-weight :bolder;
	text-decoration: underline;
}
</style>
<!-- <script src="./js/form.js"></script> -->
</head>
<body>
	<header>
		<h2>서점 정보 관리</h2>
	</header>
	<nav>
		<span id="span1"> &emsp;&emsp;<a href=c_list.jsp>고객 정보 관리</a> &emsp;
		<a href=b_list.jsp>도서 정보 관리</a> &emsp;<a href=index.jsp>홈으로</a>
		</span>
	</nav>
