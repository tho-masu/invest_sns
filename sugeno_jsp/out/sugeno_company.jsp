<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>企業</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/kigyou.css" rel="stylesheet" type="text/css">
</head>

<body>
<div style="width: 50%">
    <canvas id="chart" height="450" width="600"></canvas>
</div>
<script>
  var lineChartData = {
    labels : ["1月","2月","3月","4月","5月","6月"],
    datasets : [
      {
        label: "私",
        fillColor : /*"#f2dae8"*/"rgba(242,218,232,0.6)",
        strokeColor : /*"#dd9cb4"*/"rgba(221,156,180,0.6)",
        pointColor : /*"#dd9cb4"*/"rgba(221,156,180,0.6)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : /*"#dd9cb4"*/"rgba(221,156,180,0.6)",
        data : [67,65,66,70,71,77]
      },
      {
        label: "彼",
        fillColor : /*"#afd0ef"*/"rgba(175,208,239,0.6)",
        strokeColor : /*"#fb7dd8"*/"rgba(143,183,221,0.6)",
        pointColor : /*"#8fb7dd"*/"rgba(143,183,221,0.6)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : /*"#8fb7dd"*/"rgba(143,183,221,0.6)",
        data : [57,56,55,53,56,49]
      }
    ]

  }

  window.onload = function(){
    var ctx = document.getElementById("chart").getContext("2d");
    window.myLine = new Chart(ctx).Line(lineChartData, {
      responsive: true
      // 下記を追加すると線がまっすぐになります
      /* bezierCurve: false */
    });
  }
</script>
 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table border="3">
   <tr>
     <td rowspan="2">晴れ</td>
     <td>ソニー（5973）</td>
     <td>お買い得度（PER)：14.8</td>
     <td rowspan="2">ブックマーク</td>
   </tr>
   <tr>
     <td>東証一部・電気機器</td>
     <td>企業の稼ぐ力（ROE)：27.295</td>
   </tr>
   <tr>
 </table>

 <%-- チャート --%>
 <table border="1" width="500" >
  <tr>
   <td>チャート</td>
  </tr>

  </table>
<table class="point">
  <tr>
   <td align="center">注目ポイント</td>
  </tr>
</table>
  <%-- 注目ポイント --%>
  <table class="interest_point">

  <tr>
   <th>会社のお名前（和）</th>
   <td><%=request.getAttribute("v-name")%></td>
  </tr>
  <tr>
   <th>会社のお名前（英）</th>
   <td><%=request.getAttribute("v-name_en")%></td>
  </tr>
  <tr>
   <th>一年間の成績発表月（決算期）</th>
   <td><%=request.getAttribute("co_settle_fy_ended")%></td>
  </tr>
  <tr>
   <th>企業の大きさ(億円)（時価総額）</th>
   <td><%=request.getAttribute("marketcap")%></td>
  </tr>
  <tr>
   <th>株主に渡す一部の利益(円)（配当金）</th>
   <td><%=request.getAttribute("co_settle_dps")%></td>
  </tr>
  <tr>
   <th>株主への利益還元率(%)（配当性向）</th>
   <td>4.8</td>
  </tr>
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
 <table border="1" width="500" >
  <tr>
   <td>コメント</td>
  </tr>

  </table>
</body>
</html>