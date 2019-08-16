<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,masui_java.StaticList"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/tei_css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/tei_css/common.css" rel="stylesheet" type="text/css">
<%--
ArrayNode anode = (ArrayNode)request.getAttribute("anode");
String iname = (String)request.getAttribute("iname");
List<String> industryList = StaticList.industryList;
--%>

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

<div class="industry_filter">
  <form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET" align="center">
    <select name="iname">
      <option value="all" class="industry_option">業界を選ぼう！</option>
      <%--for(String element : industryList){--%>
	  <option class="industry_option" <%--if(element.equals(iname)){ %>selected<%} %> value="<%=element%>"><%=element --%></option>
      <%--} --%>
    </select>
    <input type="submit" value="GO！">
  </form>
</div>

<br>

  <%--業界ページトップ、天気表示 --%>
  <table align="center" cellpadding="5px" class="industry_top" height="210px">
    <tr height="100px">
      <td>

        <p class="sub_word">農業、林業、漁業、畜産業</p>
        <p class="main_word">水産・農林業<%--=iname --%></p>

      </td>
      <%--天気を表示 --%>
      <td  rowspan="2" align="center" width="200px">
        <img src="<%=request.getContextPath() %>/img/weather/cloud2.png" width="100px">
      </td>
    </tr>
    <%--<tr>
      <td height="100px" valign="top">
        <p class="main_word">水産・農林業<%--=iname --%></p>
      <%--</td>
    </tr> --%>
  </table>

  <%--業界の概要 --%>
  <table>
    <tr>
      <td>
        業界概要
      </td>
      <%--業界の関連画像表示 --%>
      <td>
        <img src="<%=request.getContextPath() %>/img/industry/factory.png" width="100px">
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
<%--for(int i=0;i<anode.size();i++){ --%>
    <tr>
      <td>
      	<%--<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=anode.get(i).get("securities_code").asText() %>"><%=anode.get(i).get("v-name").asText() %></a> --%>
      </td>
      <td>
		<%--=anode.get(i).get("securities_code").asText() --%>
      </td>
      <td>
      	<%--=anode.get(i).get("price").asDouble() --%>円
      </td>
    </tr>
<%--} --%>
  </table>




<%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form>
  <tr>
   <td class="sub">
     <div><textarea name="comment"></textarea></div>
     <div><input type="submit" value="送信" align="center"></div>
   </td>
  </tr>
  </form>
 </table>

 <table class="comment_list">
  <tr>
   <td class="point_top">
    コメント一覧
   </td>
  </tr>
  <tr>
   <td class="sub" class="commentword">
    コメント内容
   </td>
  </tr>
 </table>


</body>
</html>