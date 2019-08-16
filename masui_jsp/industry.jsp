<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,java.util.ArrayList,masui_java.StaticList,database.IndustryBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
ArrayNode anode = (ArrayNode)request.getAttribute("anode");
String iname = (String)request.getAttribute("iname");
List<String> industryList = StaticList.industryList;
ArrayList<ArrayList<Object>> ahistorical = (ArrayList<ArrayList<Object>>)request.getAttribute("ahistorical");
List<IndustryBean> ilist = (List<IndustryBean>)request.getAttribute("ilist");
%>

</head>

<body>



<header>

<!-- ヘッダーはじまり -->
<div align="center" align="center">
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

<%if(!(iname.equals("全業界（日経平均採用銘柄）"))){ %>

<!-- チャートを入れるテーブルはじめ -->

<table align="center" border="1">
<tr><td>

<!-- チャートはじめ -->

 <canvas id="myLineChart" height="100px"></canvas>

<script>
  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
    	  <%for(int i=0;i<ahistorical.size();i++){%>
    	  	<%if(i!=0){%>,<%}%>
    	  	'<%=(String)ahistorical.get(i).get(0)%>'
    	  <%}%>
    	  ],
      datasets: [
        {
          label: '株価',
          data: [
        	  <%for(int i=0;i<ahistorical.size();i++){%>
      	  	<%if(i!=0){%>,<%}%>
      	  	<%=(Double)ahistorical.get(i).get(1)%>
      	  <%}%>
        	  ],
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: 'この業界の平均株価'
      },
      scales: {
        yAxes: [{
          ticks: {
            callback: function(value, index, values){
              return  value +  '円'
            }
          }
        }]
      },
    }
  });
  </script>

  <!-- チャート終わり -->

  </td></tr>
</table>

<!-- チャートを入れるテーブル終わり -->

<%} %>

<div class="industry_filter">
  <form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET" align="center">
    <select name="iname">
      <option value="all" class="industry_option">全ての業界</option>
      <%for(String element : industryList){%>
		<option <%if(element.equals(iname)){ %>selected<%} %> value="<%=element%>" class="industry_option"><%=element %></option>
	  <%} %>
    </select>
    <input type="submit" value="GO！">
  </form>
</div>

<br>

  <%--業界ページトップ、天気表示 --%>
  <table align="center" cellpadding="5px" class="industry_top" height="210px">
    <tr height="100px">
      <td>

        <p class="sub_word"><%=ilist.get(0).getIdis() %></p>
        <p class="main_word"><%=iname %></p>

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
        <p>
        	<%=ilist.get(0).getIfut() %>
        </p>
      </td>
      <%--業界の関連画像表示 --%>
      <td class="overview_img">
        <img src="<%=request.getContextPath() %>/img/industry/<%=iname %>.jpg" width="220px" height="auto" align="center">
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
<%for(int i=0;i<anode.size();i++){ %>
    <tr class="sub reco_info">
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