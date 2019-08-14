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

  <%--業界のグラフ --%>

  <table>
    <tr>
      <td class="agriculture">水産農林業</td><%--大分類は水産農林業 --%>
      <td class="transport">陸運業</td><%--大分類は運輸・情報通信業 --%>
      <td class="manufacture">食料品</td><%--大分類は製造業 --%>
      <td class="manufacture">繊維製品</td><%--大分類は製造業 --%>
      <td class="manufacture">パルプ・紙</td><%--大分類は製造業 --%>
      <td class="manufacture">化学</td><%--大分類は製造業 --%>
    </tr>
    <tr>
      <td class="mining">鉱業</td><%--大分類は鉱業 --%>
      <td class="transport">海運業</td><%--大分類は運輸・情報通信業 --%>
      <td class="manufacture">医薬品</td><%--大分類は製造業 --%>
      <td class="manufacture">石油・石炭製品</td><%--大分類は製造業 --%>
      <td class="manufacture">ゴム製品</td><%--大分類は製造業 --%>
      <td class="manufacture">ガラス・土石製品</td><%--大分類は製造業 --%>
    </tr>
    <tr>
      <td class="construction">建設業</td><%--大分類は建設業 --%>
      <td class="transport">空運業</td><%--大分類は運輸・情報通信業 --%>
      <td class="manufacture">鉄鋼</td><%--大分類は製造業 --%>
      <td class="manufacture">非鉄金属</td><%--大分類は製造業 --%>
      <td class="manufacture">金属製品</td><%--大分類は製造業 --%>
      <td class="manufacture">機械</td><%--大分類は製造業 --%>
    </tr>
    <tr>
      <td class="electrics">電気・ガス業</td><%--大分類は電気・ガス業 --%>
      <td class="transport">倉庫・運輸関連業</td><%--大分類は運輸・情報通信業 --%>
      <td class="manufacture">電気機器</td><%--大分類は製造業 --%>
      <td class="manufacture">輸送用機器</td><%--大分類は製造業 --%>
      <td class="manufacture">精密機器</td><%--大分類は製造業 --%>
      <td class="manufacture">その他製品</td><%--大分類は製造業 --%>
    </tr>
    <tr>
      <td class="estate">不動産業</td><%--大分類は不動産業--%>
      <td class="transport">情報通信業</td><%--大分類は運輸・情報通信業 --%>
      <td class="finance">銀行業</td><%--大分類は金融・保険業 --%>
      <td class="finance">証券・商品先物取引業</td><%--大分類は金融・保険業--%>
      <td class="finance">保険業</td><%--大分類は金融・保険業--%>
      <td class="finance">その他金融業</td><%--大分類は金融・保険業 --%>
    </tr>
    <tr>
      <td class="commercial">卸売業</td><%--大分類は商業 --%>
      <td class="commercial">小売業</td><%--大分類は商業 --%>
      <td class="service">サービス業</td><%--大分類はサービス業 --%>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>



</body>
</html>