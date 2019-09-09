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
  <table class="list line_add">
    <tr>
      <th align="center" colspan="4" class="point_top">
        おすすめ企業
      </th>
    </tr>
    <tr class="recommend">
    	<th class="company_name" style="border-right:1px solid #a9a9a9;">
    		<b>企業名</b>
    	</th>
    	<th class="company_name" style="border-right:1px solid #a9a9a9;">
    		<b>優待内容</b>
    	</th>
    	<th class="code_num" style="border-right:1px solid #a9a9a9;">
    		<b>証券コード</b>
    	</th>
    	<th class="stock_price">
    		<b>権利確定月</b>
    	</th>
    </tr>
<%if(yList != null){ %>
<%for(int i=0;i<yList.size();i++){ %>
    <tr class="sub reco_info backcolor">
      <td style="border-right:1px solid #a9a9a9;">
      	<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=yList.get(i).getQuote() %>"><%=companyInfoNode.get(i).get("v-name").asText() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;">
      	<%=yList.get(i).getTitle() %>
      </td>
      <td style="border-right:1px solid #a9a9a9;">
		<%=yList.get(i).getQuote() %>
      </td>
      <td>
      	<%=yList.get(i).getSubfld() %>
      </td>
    </tr>
<%} %>
<%} %>
  </table>

 </body>
 </html>