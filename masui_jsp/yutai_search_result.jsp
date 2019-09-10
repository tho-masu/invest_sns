<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.YutaiBean,com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>優待情報</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
List<YutaiBean> yList = (List<YutaiBean>)request.getAttribute("yList");
JsonNode companyInfoNode = (JsonNode)request.getAttribute("companyInfoNode");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

  <%--おすすめ企業 --%>
  <h1 class="heading_title">おすすめ企業</h1>
  <table class="list line_add">
    <tr class="recommend">
    	<th class="" style="border-right:1px solid #a9a9a9;" width="30%">
    		<p>企業名</p>
    	</th>
    	<th class="" style="border-right:1px solid #a9a9a9;" width="50%">
    		<p>優待内容</p>
    	</th>
    	<th class="" style="border-right:1px solid #a9a9a9;" width="10%" align="center" valign="top">
    		<p>証券コード</p>
    	</th>
    	<th class="" width="10%" align="center" valign="top">
    		<p>権利確定月</p>
    	</th>
    </tr>
<%if(yList != null){ %>
<%for(int i=0;i<yList.size();i++){ %>
    <tr class="sub reco_yutai_info backcolor">
      <td style="border-right:1px solid #a9a9a9;" align="center" valign="top">
      	<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=yList.get(i).getQuote() %>"><%=companyInfoNode.get(i).get("v-name").asText() %></a>
      </td>
      <td style="border-right:1px solid #a9a9a9;">
      	<%=yList.get(i).getTitle() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;" align="center" valign="top">
		<%=yList.get(i).getQuote() %>
      </td>
      <td align="center" valign="top">
      	<%=yList.get(i).getSubfld() %>
      </td>
    </tr>
<%} %>
<%} %>
  </table>

 </body>
 </html>