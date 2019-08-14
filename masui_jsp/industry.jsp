<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<%
ArrayNode anode = (ArrayNode)request.getAttribute("anode");
%>

  <%--業界ページトップ、天気表示 --%>
  <table border="2">
    <tr>
      <td>
        業界：<%=request.getAttribute("iname") %>
      </td>
      <%--天気を表示 --%>
      <td>
        <img src="">
      </td>
    </tr>
  </table>

  <%--業界の概要 --%>
  <table>
    <tr>
      <td>
        業界概要
      </td>
      <%--業界の関連画像表示 --%>
      <td>
        <img src="">
      </td>
    </tr>
  </table>

  <%--おすすめ企業 --%>
  <table border="2">
    <tr>
      <th align="center" colspan="3">
        <b>おすすめ企業</b>
      </th>
    </tr>
    <tr>
    	<td>
    		<b>企業名</b>
    	</td>
    	<td>
    		<b>証券コード</b>
    	</td>
    	<td>
    		<b>株価</b>
    	</td>
    </tr>
<%for(int i=0;i<anode.size();i++){ %>
    <tr>
      <td>
      	<a href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=anode.get(i).get("securities_code").asText() %>"><%=anode.get(i).get("v-name").asText() %>
      </td>
      <td>
		<%=anode.get(i).get("securities_code").asText() %>
      </td>
      <td>
      	<%=anode.get(i).get("price").asDouble() %>
      </td>
    </tr>
<%} %>
  </table>

  <%--コメント送信 --%>
 <table border="1">
  <tr>
   <td>コメント欄</td>
  </tr>
  <form>
    <tr>
     <td>
       <textarea name="comment" rows="4" cols="40"></textarea>
     </td>
    </tr>
    <tr>
     <td>
       <input type="submit" value="送信">
     </td>
    </tr>
  </form>
 </table>

 <%-- コメント --%>
 <table border="1" width="500">
  <tr>
   <td>コメント</td>
  </tr>
  </table>

  <br><br>

  <%=request.getAttribute("anode") %>

</body>
</html>