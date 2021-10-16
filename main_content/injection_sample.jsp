<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>お客さま情報登録</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
List<UserBean> ulist = (List<UserBean>)request.getAttribute("ulist");
%>

</head>

<body>


<div class="top_market_search">
  <h1 align="center" class="heading_title">お客さま情報を登録できます</h1>
  <form action="<%=request.getContextPath() %>/main_content/injection_sample" method="POST">
	  <input class="search_box" type="text" placeholder="お名前" name="insert">
	        		<input class="search_btn" type="submit" id="search_button" value="情報登録">
  </form>
</div>

<br>

<div class="top_market_search">
  <h1 align="center" class="heading_title">お客さま情報を確認できます</h1>
  <form action="<%=request.getContextPath() %>/main_content/injection_sample" method="POST">
	  <input class="search_box" type="text" placeholder="ユーザーID" name="user_id">
	        		<input class="search_btn" type="submit" id="search_button" value="情報参照">
  </form>
</div>


<%if(ulist != null){ %>
  <h1 class="heading_title">お客さま情報</h1>
  <table class="list line_add">

    <tr class="recommend">
    	<th class="company_name" style="border-right:1px solid #a9a9a9;" style="width:34%;">
    		<b>ユーザーID</b>
    	</th>
    	<th class="code_num" style="border-right:1px solid #a9a9a9;" style="width:33%;">
    		<b>ユーザー名</b>
    	</th>
    	<th class="stock_price" style="border-right:1px solid #a9a9a9;" style="width:33%;">
    		<b>パスワード</b>
    	</th>
    </tr>
<%for(int i=0;i<ulist.size();i++){ %>
    <tr class="sub reco_info backcolor">
      <td style="border-right:1px solid #a9a9a9;" class="hover_word" style="width:34%;">
		<%=ulist.get(i).getUser_id() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;" style="width:33%;">
		<%=ulist.get(i).getUsername() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;" style="width:33%;">
      	<%=ulist.get(i).getPassword() %>
      </td>
    </tr>
<%} %>
  </table>
<%} %>

</body>
</html>