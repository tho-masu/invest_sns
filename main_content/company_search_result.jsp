<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.CompanySearchBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>企業名検索</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
List<CompanySearchBean> cList = (List<CompanySearchBean>)request.getAttribute("cList");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

  <%--おすすめ企業 --%>
  <h1 class="heading_title">おすすめ企業</h1>
  <table class="list line_add">
    <tr class="recommend">
    	<th class="" style="border-right:1px solid #a9a9a9;" width="40%">
    		<p>企業名</p>
    	</th>
    	<th class="" style="border-right:1px solid #a9a9a9;" width="40%">
    		<p>企業名（英）</p>
    	</th>
    	<th class="" width="20%" align="center" valign="top">
    		<p>証券コード</p>
    	</th>
    </tr>
<%if(cList != null){ %>
<%for(int i=0;i<cList.size();i++){ %>
    <tr class="sub reco_yutai_info backcolor">
      <td style="border-right:1px solid #a9a9a9;" align="center">
      	<a class="widelink hover_word" href="<%=request.getContextPath() %>/main_content/company?quote=<%=cList.get(i).getQuote() %>"><%=cList.get(i).getvName() %></a>
      </td>
      <td style="border-right:1px solid #a9a9a9;" align="center">
      	<a class="widelink hover_word" href="<%=request.getContextPath() %>/main_content/company?quote=<%=cList.get(i).getQuote() %>"><%=cList.get(i).getvNameEn() %></a>
      </td>
      <td align="center">
      	<%=cList.get(i).getQuote() %>
      </td>
    </tr>
<%} %>
<%} %>
  </table>

 </body>
 </html>