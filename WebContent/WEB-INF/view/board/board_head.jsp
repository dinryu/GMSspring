<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>학생성적 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootst"/>
</head>
<body>
<div id="wrapper">
	<header>
		<h1 id="title">게시판 관리</h1>
		<%= 
		new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss").format(new Date())
		%>
		<a id="go_main" href="<%=request.getContextPath()%>/index.jsp">메인으로 가기</a><br>
	</header>
	<hr/>
</div>
</body>
</html>