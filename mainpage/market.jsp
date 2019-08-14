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
  <%--画面上部分 --%>
  <table>
    <tr>
      <td>
        <%--日経平均の情報 --%>
        Nikkei225:20166円
      </td>
      <td>
        <%--銘柄検索 --%>
        <form action="" method="post">
          <input type="search" name="stock_search" placeholder="銘柄検索">
          <input type="submit" name="stock_submit" value="検索">
        </form>
      </td>
    </tr>
  </table>

  <%--業界の天気別のグラフ --%>

  <div>
    <p>天気別の業界・分野数
  </div>
  <div>
    <%--業界天気別のグラフをここに表示 --%>
  </div>


</body>
</html>