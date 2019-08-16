<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,masui_java.StaticList"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
ArrayNode anode = (ArrayNode)request.getAttribute("anode");
String iname = (String)request.getAttribute("iname");
List<String> industryList = StaticList.industryList;
%>

</head>

<body>

<br>

<header>

<!-- ヘッダーはじまり -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

</header>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/mypage.jsp">マイページ</a></li>
  </ul>
</nav>

<br><br><br><br>

<!-- ヘッダー終わり -->

<form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET" align="center">
業界フィルタ：<select name="iname">
<option value="all">（フィルタ解除）</option>
<%for(String element : industryList){%>
	<option <%if(element.equals(iname)){ %>selected<%} %> value="<%=element%>"><%=element %></option>
<%} %>
</select>
<input type="submit" value="GO！">
</form>

  <%--業界ページトップ、天気表示 --%>
  <table border="2" align="center" cellpadding="5px">
    <tr>
      <td>
        業界：<%=iname %>
      </td>
      <%--天気を表示 --%>
      <td>
        <img src="<%=request.getContextPath() %>/img/weather/hare.png" width="50px">
      </td>
    </tr>
  </table>

  <%--業界の概要 --%>
  <table align="center" border="1">
    <tr>
      <td>
        業界概要
      </td>
      <%--業界の関連画像表示 --%>
      <td>
        <img style="margin-right:0.7em" align="left" src="<%=request.getContextPath() %>/img/industry/<%=iname %>.jpg" height="200px">
        ここに業界の説明が入ります
      </td>
    </tr>
  </table>

  <%--おすすめ企業 --%>
  <table border="2" align="center" width="80%" class="list">
    <tr>
      <th align="center" colspan="3" bgcolor="#FFFFFF">
        <b>おすすめ企業</b>
      </th>
    </tr>
    <tr>
    	<th bgcolor="#FFFFFF">
    		<b>企業名</b>
    	</th>
    	<th bgcolor="#FFFFFF">
    		<b>証券コード</b>
    	</th>
    	<th bgcolor="#FFFFFF">
    		<b>株価</b>
    	</th>
    </tr>
<%for(int i=0;i<anode.size();i++){ %>
    <tr>
      <td>
      	<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=anode.get(i).get("securities_code").asText() %>"><%=anode.get(i).get("v-name").asText() %></a>
      </td>
      <td>
		<%=anode.get(i).get("securities_code").asText() %>
      </td>
      <td>
      	<%=anode.get(i).get("price").asDouble() %>円
      </td>
    </tr>
<%} %>
  </table>

<br>

  <%--コメント送信 --%>
 <table border="1" align="center">
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

<br>

 <%-- コメント --%>
 <table border="1" width="500" align="center">
  <tr>
   <td>コメント</td>
  </tr>
  </table>

  <br><br>



</body>
</html>