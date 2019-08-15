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
String iname = (String)request.getAttribute("iname");
%>
<form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET">
業界フィルタ：<select name="iname">
<option value="全銘柄">（フィルタ解除）</option>
<option value="水産・農林業">水産・農林業</option>
<option value="鉱業">鉱業</option>
<option value="建設業">建設業</option>
<option value="食料品">食料品</option>
<option value="繊維製品">繊維製品</option>
<option value="パルプ・紙">パルプ・紙</option>
<option value="化学">化学</option>
<option value="医薬品">医薬品</option>
<option value="石油石炭製品">石油石炭製品</option>
<option value="ゴム製品">ゴム製品</option>
<option value="ｶﾞﾗｽ土石製品">ｶﾞﾗｽ土石製品</option>
<option value="鉄鋼">鉄鋼</option>
<option value="非鉄金属">非鉄金属</option>
<option value="金属製品">金属製品</option>
<option value="機械">機械</option>
<option value="電気機器">電気機器</option>
<option value="輸送用機器">輸送用機器</option>
<option value="精密機器">精密機器</option>
<option value="その他製品">その他製品</option>
<option value="電気・ガス業">電気・ガス業</option>
<option value=" 陸運業"> 陸運業</option>
<option value="海運業">海運業</option>
<option value="空運業">空運業</option>
<option value="倉庫運輸関連">倉庫運輸関連</option>
<option value="情報・通信業">情報・通信業</option>
<option value="卸売業">卸売業</option>
<option value="小売業">小売業</option>
<option value="銀行業">銀行業</option>
<option value="証券商品先物">証券商品先物</option>
<option value="保険業">保険業</option>
<option value="その他金融業">その他金融業</option>
<option value="不動産業">不動産業</option>
<option value="サービス業">サービス業</option>
</select>
<input type="submit" value="GO！">
</form>

<br>

  <%--業界ページトップ、天気表示 --%>
  <table border="2">
    <tr>
      <td>
        業界：<%=iname %>
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
      	<a href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=anode.get(i).get("securities_code").asText() %>"><%=anode.get(i).get("v-name").asText() %></a>
      </td>
      <td>
		<%=anode.get(i).get("securities_code").asText() %>
      </td>
      <td>
      	<%=anode.get(i).get("price").asInt() %>円
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



</body>
</html>