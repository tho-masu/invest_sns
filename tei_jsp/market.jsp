<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.JsonNode,java.lang.Math,java.util.List,java.util.Date,java.sql.Time"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<%
JsonNode nnode = (JsonNode)(request.getAttribute("nnode"));
%>
<title>マーケットページ</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/tei_css/default.css" rel="stylesheet" type="text/css">
</head>

<body>




<% for(int i=0;i<nnode.size();i++){%>
		<%=nnode.get(i).get("headline").asText() %><%} %>
</body>
</html>


