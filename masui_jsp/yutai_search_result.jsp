<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.YutaiBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
List<YutaiBean> yList = (List<YutaiBean>)request.getAttribute("yList");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

  <%--おすすめ企業 --%>
  <table class="list line_add">
    <tr>
      <th align="center" colspan="3" class="point_top">
        おすすめ企業
      </th>
    </tr>
    <tr class="recommend">
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