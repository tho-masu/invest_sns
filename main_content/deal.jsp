<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.CommentBean,database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>取引</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
List<IndustryBean> ilist = (List<IndustryBean>)request.getAttribute("ilist");
List<CommentBean> clist = (List<CommentBean>)(request.getAttribute("clist"));
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />


<h1 class="heading_title">大手証券会社一覧</h1>
<table class="list industryweather">
<%--
	<tr class="industryweather_head">
		<th>
			大手証券会社一覧
		</th>

	</tr>
 --%>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://hometrade.nomura.co.jp/web/rmfIndexWebAction.do" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">野村證券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://www.daiwa.co.jp/PCC/HomeTrade/Account/m8301.html" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">大和証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://trade.smbcnikko.co.jp/Login/0/login/ipan_web/hyoji/" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">SMBC日興証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://netclub.mizuho-sc.com/mnc/login?rt_bn=sc_top_main" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">みずほ証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://online.sc.mufg.jp/its/dfw/UTBSITS/user_p/Login" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">三菱ＵＦＪモルガン・スタンレー証券</p>
			</a>
		</td>
	</tr>
</table>

<h1 class="heading_title">大手ネット証券会社一覧</h1>

<table class="list industryweather">
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://www.sbisec.co.jp/ETGate" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">SBI証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://www.rakuten-sec.co.jp/web/direct_login.html" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">楽天証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://www.deal.matsui.co.jp/ITS/login/MemberLogin.jsp" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">松井証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://mst.monex.co.jp/pc/ITS/login/LoginIDPassword.jsp" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">マネックス証券</p>
			</a>
		</td>
	</tr>
	<tr class="reco_info">
		<td align="center" class=" hover_word">
			<a class="widelink" href="https://s10.kabu.co.jp/_mem_bin/members/login.asp?/members/" target="_blank">
			<p style="padding-top: 20px;padding-bottom: 20px">カブドットコム証券</p>
			</a>
		</td>
	</tr>

</table>




<br><br><br>
<footer>
<center><font size="2">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>
</footer>
<br>
</body>
</html>