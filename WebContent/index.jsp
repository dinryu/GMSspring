<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="${js}/member.js" ></script>
<img src="${img}/loading.gif" />
  <script>
  
  $(document).ready(function(){
	  app.init('${ctx}');
  });
	 // location.href="${ctx}/home.do";
  </script>