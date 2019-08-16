<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,masui_java.StaticList"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/sugeno_css/common.css" rel="stylesheet" type="text/css">
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



<!-- ヘッダー終わり -->

<div class="industry_filter" align="center">
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


  <%--業界ページトップ、天気表示 --%>
  <table align="center" cellpadding="5px" class="industry_top" height="210px">
    <tr height="100px">
      <td>

        <p class="sub_word">農業、林業、漁業、畜産業</p>
        <p class="main_word">水産・農林業<%--=iname --%></p>

      </td>
      <%--天気を表示 --%>
      <td  rowspan="2" align="center" width="200px">
        <img src="<%=request.getContextPath() %>/img/weather/晴れる.png" width="100px">
      </td>
    </tr>
  </table>

  <%--業界の概要 --%>
  <table class="industry_overview">
    <tr height="220px">
      <td class="overview">
        <h3>業界動向</h3>
        <p>地球温暖化による水産資源の減少、日本周辺水域における近隣諸国との摩擦、人口減少による国内消費の低下など、
           現在の水産業を取り巻く環境は厳しい。日本食文化の発信とともに水産物の輸出拡大を図る。農林業には、狭い農地面積、
           就業人口の減少、高齢化による後継者不足、耕作放棄地の拡大といった問題があり、政府はさまざまな規制改革に取り組んでおり、
           農林業界は今大きな転換ポイントを迎えている。
        </p>
      </td>
      <%--業界の関連画像表示 --%>
      <td class="overview_img">
        <img src="<%=request.getContextPath() %>/img/industry/水産・農林業.jpg" width="220px" height="auto" align="center">
      </td>
    </tr>
  </table>

  <%--おすすめ企業 --%>
  <table align="center" width="80%" class="list">
    <tr>
      <th align="center" colspan="3" class="point_top">
        おすすめ企業
      </th>
    </tr>
    <tr class="recommend">
    	<th class="company_name">
    		<b>企業名</b>
    	</th>
    	<th class="code_num">
    		<b>証券コード</b>
    	</th>
    	<th class="stock_price">
    		<b>株価</b>
    	</th>
    </tr>
<%--for(int i=0;i<anode.size();i++){ --%>
    <tr class="sub reco_info">
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
     <div><input type="submit" value="送信" align="center" class="submit_div"></div>
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