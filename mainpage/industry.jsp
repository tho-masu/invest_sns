<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>企業</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

  <%--業界ページトップ、天気表示 --%>
  <table>
    <tr>
      <td>
        業界
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
  <table>
    <tr>
      <td align="center">
        おすすめ企業
      </td>
    </tr>
    <tr>
      <td width="200">
        <div>
          <%--企業の画像や写真、width指定、heightはauto --%>
          <div><img src=""></div>
          <div>企業1</div>
        </div>
      </td>
      <td width="200">
        <div>
          <%--企業の画像や写真、width指定、heightはauto --%>
          <div><img src=""></div>
          <div>企業2</div>
        </div>
      </td>
      <td width="200">
        <div>
          <%--企業の画像や写真、width指定、heightはauto --%>
          <div><img src=""></div>
          <div>企業3</div>
        </div>
      </td>
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