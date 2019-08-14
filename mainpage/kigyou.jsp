<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>企業</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>

<body>
 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table border="1" width="1400">
   <tr>
     <td rowspan="2" align="center" width="300">晴れ</td>
     <td>企業名（株価）</td>
     <td>お買い得度（PER)</td>
     <td rowspan="2" align="center" width="300">ブックマーク</td>
   </tr>
   <tr>
     <td>簡単紹介</td>
     <td>企業の稼ぐ力（ROE)</td>
   </tr>
   <tr>
 </table>

 <%-- チャート --%>
 <table border="1" width="500" >
  <tr>
   <td>チャート</td>
  </tr>

  </table>

  <%-- 注目ポイント --%>
  <table border="1" width="700" >
  <tr>
   <td align="center">注目ポイント</td>
  </tr>
  <tr>
   <td>会社のお名前（和）</td>
  </tr>
  <tr>
   <td>会社のお名前（英）</td>
  </tr>
  <tr>
   <td>一年間の成績発表月（決算期）</td>
  </tr>
  <tr>
   <td>企業の大きさ（時価総額）</td>
  </tr>
  <tr>
   <td>株主に渡す一部の利益（配当金）</td>
  </tr>
  <tr>
   <td>（配当利回り）</td>
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
 <table border="1" width="500">
  <tr>
   <td>コメント</td>
  </tr>
  </table>
</body>
</html>