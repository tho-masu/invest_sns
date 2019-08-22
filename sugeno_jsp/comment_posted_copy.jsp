<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">


<link href="<%=request.getContextPath()%>/sugeno_css/common.css" rel="stylesheet" type="text/css">
<title><%--if(error == null){ --%>送信完了<%--}else{ --%>エラー<%--} --%></title>
</head>

<%--編集するため変更 --%>


<%--
String quote = (String)request.getAttribute("quote");
String iname = (String)request.getAttribute("iname");
String error = (String)request.getAttribute("error");
--%>



<body>



<table class="comment_submit">
  <tr>
    <td class="point_top">
    <%--if(error == null){ --%>
    コメントの送信が完了しました。元のページに戻りますか？
    <%--}else{ --%>
    <%--=error --%>
    <%--} --%>
    </td>
  </tr>
  <%--if(quote != null){ --%>
  <tr>
    <td class="sub" style="background-color: #FFFFFF" align="center">
      <div class="yes_no_form">
      <form action="<%=request.getContextPath() %>/masui_jsp/company" method="GET">
	    <input type="hidden" name="quote" value="<%--=quote --%>">
	    <span class="yes"><input type="submit" value="はい" onClick="location.href='<%=request.getContextPath() %>/masui_jsp/market'"></span>
	    <span><input type="submit" value="いいえ" onClick="location.href='<%=request.getContextPath() %>/'"></span>
      </form>
      </div>
    </td>
  </tr>
  <%--}else if(iname != null){ --%>
  <tr>
    <td class="sub" style="background-color: #FFFFFF">
      <div class="yes_no_form">
      <form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET">
	    <input type="hidden" name="iname" value="<%--=iname --%>">
	    <span class="yes"><input type="submit" value="はい" onClick="location.href='<%=request.getContextPath() %>/masui_jsp/market'"></span>
	    <span><input type="submit" value="いいえ" onClick="location.href='<%=request.getContextPath() %>/'"></span>
      </form>
      </div>
    </td>
  </tr>
  <%--}else{ --%>
  <tr>
    <td class="sub yes_no_margin" style="background-color: #FFFFFF">
	    <div class="yes_no_form">
	      <input type="button" value="元のページへ" align="center" onClick="location.href='<%=request.getContextPath() %>/masui_jsp/market'">
	    </div>
    </td>
  </tr>
  <%--} --%>
</table>