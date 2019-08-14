<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>企業</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/kigyou.css" rel="stylesheet" type="text/css">
</head>

<body>
 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table border="3">
   <tr>
     <td rowspan="2">晴れ</td>
     <td><%=request.getAttribute("v-name")%>（<%=request.getAttribute("search")%>）</td>
     <td>お買い得度（PER)：<%=request.getAttribute("co_per")%></td>
     <td rowspan="2">ブックマーク</td>
   </tr>
   <tr>
     <td><%=request.getAttribute("listed_section")%>・<%=request.getAttribute("industry_name")%></td>
     <td>企業の稼ぐ力（ROE)：<%=request.getAttribute("co_settle_roe")%></td>
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
   <td><%=request.getAttribute("co_settle_dividend_payout")%></td>
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