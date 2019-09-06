<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,java.util.ArrayList,masui_java.StaticList,database.IndustryBean,database.CommentBean,database.UserBean"%>
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
IndustryBean iinfo = (IndustryBean)request.getAttribute("iinfo");
List<CommentBean> clist = (List<CommentBean>)request.getAttribute("clist");
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
List<Boolean> existYutai = (List<Boolean>)request.getAttribute("existYutai");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<div class="industry_filter">
  <form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET" align="center">
    <select name="iname">
      <option value="全業界（日経平均採用銘柄）" class="industry_option">全ての業界</option>
      <%for(String element : industryList){%>
		<option <%if(element.equals(iname)){ %>selected<%} %> value="<%=element%>" class="industry_option"><%=element %></option>
	  <%} %>
    </select>
    <input type="submit" value="GO！">
  </form>
</div>



  <%--業界ページトップ、天気表示 --%>
  <table align="center" cellpadding="5px" class="industry_top" height="210px">
    <tr height="100px">
      <td>

        <p class="sub_word"><%=iinfo.getIdis() %></p>
        <p class="main_word"><%=iname %></p>

      </td>
      <%--天気を表示 --%>
      <td  rowspan="2" align="center" width="200px">
        <img src="<%=request.getContextPath() %>/img/weather/<%=iinfo.getWeather() %>.png" width="150px">
      </td>
    </tr>
  </table>

  <%--業界の概要 --%>
  <table class="industry_overview">
    <tr height="220px">
      <td class="overview">
        <h3>業界動向</h3>
        <p>
        	<%=iinfo.getIfut() %>
        </p>
      </td>
      <%--業界の関連画像表示 --%>
      <td class="overview_img">
        <img src="<%=request.getContextPath() %>/img/industry/<%=iname %>.jpg" width="300px" height="auto">
      </td>
    </tr>
  </table>

<%if(!(iname.equals("全業界（日経平均採用銘柄）"))){ %>

<!-- チャートを入れるテーブルはじめ -->
<h1 class="heading_title"><%=iname %>の平均株価</h1>
<table class="comment_submit">
<%--
<tr>
  <td class="point_top">
    <%=iname %>の平均株価
  </td>
</tr> --%>
<tr>
  <td>

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
        	  borderColor: "#66ccff",
              borderWidth:5,
              fillColor : "rgba(0,180,255,0.1)",
              backgroundColor:"rgba(0,180,255,0.1)",
              strokeColor:"rgba(0,180,255,0.1)",
              //pointBackgroundColor: "rgba(0,180,255,0.1)",
              //pointBorderColor : "rgba(255, 255, 255,1)"",
    		  pointBorderWidth:10,
    		  pointColor : "rgba(0,180,255,0.1)",
    		  pointStrokeColor : "rgba(255, 255, 255,1)",
              lineTension:0
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


  <%--おすすめ企業 --%>
  <h1 class="heading_title">おすすめ企業</h1>
  <table class="list line_add">
  <%--
    <tr>
      <th align="center" colspan="3" class="point_top">
        おすすめ企業
      </th>
    </tr>
     --%>
    <tr class="recommend">
    	<th class="company_name" style="border-right:1px solid #a9a9a9;">
    		<b>企業名</b>
    	</th>
    	<th class="code_num" style="border-right:1px solid #a9a9a9;">
    		<b>証券コード</b>
    	</th>
    	<th class="stock_price" style="border-right:1px solid #a9a9a9;">
    		<b>株価</b>
    	</th>
    	<th class="stock_price">
    		<b>株主優待の有無</b>
    	</th>
    </tr>
<%for(int i=0;i<anode.size();i++){ %>
    <tr class="sub reco_info backcolor">
      <td style="border-right:1px solid #a9a9a9;">
      	<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=anode.get(i).get("securities_code").asText() %>"><%=anode.get(i).get("v-name").asText() %></a>
      </td>
      <td style="border-right:1px solid #a9a9a9;">
		<%=anode.get(i).get("securities_code").asText() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;">
      	<%=anode.get(i).get("price").asDouble() %>円
      </td>
      <td>
      	<%if(existYutai.get(i) == true){ %>
      		<font color=red>あり</font>
      	<%}else{ %>
      		<font color=blue>なし</font>
      	<%} %>
      </td>
    </tr>
<%} %>
  </table>




<%--コメント送信 --%>
 <table class="comment_submit">
 <%--
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
   --%>

  <tr>
   <td class="sub">
     <h1 class="heading_title">コメント欄</h1>
     <form action="<%=request.getContextPath() %>/masui_jsp/comment" method="POST">
     <div><textarea name="comment"></textarea></div>
     <input type="hidden" name="iname" value="<%=iname %>">
     <div><input type="submit" value="送信" class="submit_div"></div>
     </form>
   </td>
  </tr>
 </table>

<%--
<table class="comment_list">
  <tr>
   <td class="point_top"> --%>
  <h1 class="heading_title">コメント一覧</h1>
   <%--</td>
  </tr>
 </table> --%>
<%if(clist!=null){ %>
 <%--コメントとコメントした人の名前やアイコン --%>
<table class="article_table">
 <%--コメント --%>
  <%for(CommentBean cbean : clist){ %>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=cbean.getUser_id()%>"><img src="<%=request.getContextPath() %>/img/user_icon/<%=cbean.getIcon_name() %>" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=cbean.getUser_id()%>"><%=cbean.getUsername() %></a></p>

	<%if(loginAccount.getPk_id() == cbean.getFk_user()){ %>
       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
        	<input type="hidden" name="pk_comment" value="<%=cbean.getPk_comment() %>">
     		<input type="hidden" name="fk_user" value="<%=cbean.getFk_user() %>">
     		<input type="hidden" name="iname" value="<%=iname %>">
		 	<input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>
	   <%--追加ここまで --%>
	 <%} %>

       <div class="top_article_home">
         <div><%=cbean.getDate() %> <%=cbean.getTime() %></div>
         <article>
         	<%=cbean.getComment() %>
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--コメント終了 --%>
 <%} %>
</table>
<%} %>

</body>
</html>