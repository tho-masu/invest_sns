<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,masui_java.StaticList"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マーケット</title>
<%--共通項目 --%>
<jsp:include page="common_list_inhead.jsp" flush="true" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%--
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
List<String> industryList = StaticList.industryList;
--%>

</head>

<body>
<%-- 投稿ページへのボタン --%>
<div class="post_icon_function">
  <a href="<%=request.getContextPath()%>/sugeno_jsp/post_copy.jsp">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px">
  </a>
</div>

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

<%--共通項目 --%>
<jsp:include page="common_list_inbody.jsp" flush="true" />

<!-- チャートを入れるテーブルはじめ -->

<table width="800px" align="center">
  <tr>
    <td class="point_top">日経平均株価（今日の現在までの値動き）</td>
  </tr>
  <tr class="sub">
    <td>
	<!-- チャートはじめ -->

	 <canvas id="myLineChart"></canvas>

	<script>
	  var ctx = document.getElementById("myLineChart");
	  var myLineChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: [
	    	  <%--for(int i=0;i<hnode.size();i++){%>
	    	  	<%if(i!=0){%>,<%}%>
	    	  	'<%=hnode.get(i).get("time").asText()%>'
	    	  <%}--%>
	    	  ],
	      datasets: [
	        {
	          label: '株価',
	          data: [
	        	  <%--for(int i=0;i<hnode.size();i++){%>
	      	  	<%if(i!=0){%>,<%}%>
	      	  	<%=hnode.get(i).get("price").asDouble()%>
	      	  <%}--%>
	        	  ],
	          borderColor: "rgba(255,0,0,1)",
	          backgroundColor: "rgba(0,0,0,0)"
	        }
	      ],
	    },
	    options: {
	      title: {
	        display: true,
	        //text: '日経平均株価（今日の現在までの値動き）'
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

    </td>
  </tr>
</table>

<!-- チャートを入れるテーブル終わり -->


<table align="center" border="1" class="list industryweather">
	<tr class="industryweather_head">
		<th width="70%">
			業界
		</th>
		<th width="30%">
			景気動向
		</th>
	</tr>
	<%-- for(String element : industryList){ --%>
	<tr class="reco_info">
		<td align="center">
			<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/industry?iname=<%--=element--%>"> <p style="padding-top: 20px;padding-bottom: 20px">金融業<%--=element --%></p> </a>
		</td>
		<td align="center">
			<img src="<%=request.getContextPath() %>/img/weather/Sunny.png" height="50px">
		</td>
	</tr>
	<%----テスト用のため後で消してよい<tr></tr> --%>
	<tr class="reco_info">
		<td align="center">
			<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/industry?iname=<%--=element--%>"> <p style="padding-top: 20px;padding-bottom: 20px">金融業<%--=element --%></p> </a>
		</td>
		<td align="center">
			<img src="<%=request.getContextPath() %>/img/weather/Sunny.png" height="50px">
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
 </table>

 <%--コメントとコメントした人の名前やアイコン --%>
<table class="article_table">
 <%--一人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>

       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
         <input type="hidden" name="pk_comment" value="<%--=cbean.getPk_comment() --%>">
     	 <input type="hidden" name="fk_user" value="<%--=cbean.getFk_user() --%>">
		 <%--<input type="submit" name="btn" value="削除"> --%>
		 <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>
	   <%--追加ここまで --%>

       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--一人目終了 --%>
 <%--二人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>

       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
         <input type="hidden" name="pk_comment" value="<%--=cbean.getPk_comment() --%>">
     	 <input type="hidden" name="fk_user" value="<%--=cbean.getFk_user() --%>">
		 <%--<input type="submit" name="btn" value="削除"> --%>
		 <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>

       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--二人目終了 --%>
</table>

<br><br><br>
<footer>
<center><font size="2">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>
</footer>
<br>
</body>
</html>