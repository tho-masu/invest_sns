/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-15 09:50:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.masui_005fjsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.fasterxml.jackson.databind.JsonNode;
import java.lang.Math;

public final class company_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.lang.Math");
    _jspx_imports_classes.add("com.fasterxml.jackson.databind.JsonNode");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"ja\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js\"></script>\r\n");
      out.write("\r\n");

JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
JsonNode nnode = (JsonNode)(request.getAttribute("nnode"));

      out.write("\r\n");
      out.write("\r\n");
      out.write("<title>[");
      out.print(dnode.get("req_code").asText() );
      out.write(']');
      out.write(' ');
      out.print(dnode.get("v-name").asText() );
      out.write("</title>\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/default.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("<header>\r\n");
      out.write("\r\n");
      out.write("<!-- ヘッダーはじまり -->\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write("<a href=\"");
      out.print(request.getContextPath() );
      out.write("/\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/img/investagram.png\" width=\"240px\"></a>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("<nav>\r\n");
      out.write("  <ul>\r\n");
      out.write("    <li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/\">ホーム</a></li>\r\n");
      out.write("    <li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/masui_jsp/market\">市場</a></li>\r\n");
      out.write("    <li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/masui_jsp/industry\">業界</a></li>\r\n");
      out.write("    <li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/mypage.jsp\">マイページ</a></li>\r\n");
      out.write("  </ul>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("<br><br>\r\n");
      out.write("\r\n");
      out.write("<!-- ヘッダー終わり -->\r\n");
      out.write("\r\n");
      out.write("<div id=\"all_table\">\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" <table id=\"top_table\" border=\"0\">\r\n");
      out.write("   <tr>\r\n");
      out.write("     <td colspan=\"4\" align=\"center\" id=\"top_company\">");
      out.print(dnode.get("v-name").asText() );
      out.write('（');
      out.print(dnode.get("price").asDouble() );
      out.write("円）</td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   <tr class=\"top_sub\">\r\n");
      out.write("     <td rowspan=\"3\" align=\"left\" width=\"15%\"><img hspace=\"10px\" src=\"");
      out.print(request.getContextPath());
      out.write("/img/weather/hare.png\" width=\"100px\"></td>\r\n");
      out.write("     <td rowspan=\"3\" width=\"40%\">簡単紹介</td>\r\n");
      out.write("     <td align=\"left\">お買い<font color=\"red\">損</font>度（PER)：");
      out.print(dnode.get("co_per").asDouble() );
      out.write("</td>\r\n");
      out.write("     <td rowspan=\"3\" align=\"right\" width=\"15%\">bookmark</td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   <tr class=\"top_sub\">\r\n");
      out.write("     <td align=\"left\">お買い<font color=\"blue\">得</font>度（1/PER)：");
      out.print((double)Math.round( 10000/(dnode.get("co_per").asDouble()) ) / 10000 );
      out.write("</td>\r\n");
      out.write("   </tr>\r\n");
      out.write("   <tr class=\"top_sub\">\r\n");
      out.write("     <td align=\"left\">企業の稼ぐ力（ROE)：");
      out.print(dnode.get("co_settle_roe").asDouble() );
      out.write("</td>\r\n");
      out.write("   </tr>\r\n");
      out.write(" </table>\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" <table class=\"chart\">\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  <tr><td align=\"center\" class=\"point_top\">チャート</td></tr>\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  <tr class=\"sub\">\r\n");
      out.write("   <td align=\"center\" height=\"50px\">\r\n");
      out.write("   <div id=\"chartbtn_margin\">\r\n");
      out.write("    <a class=\"cp_btn\" href=\"company?quote=");
      out.print(dnode.get("req_code").asText());
      out.write("&days=7\">7日間</a>\r\n");
      out.write("   \t<a class=\"cp_btn\" href=\"company?quote=");
      out.print(dnode.get("req_code").asText());
      out.write("&days=30\">30日間</a>\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write(" <!-- チャートはじめ -->\r\n");
      out.write("\r\n");
      out.write(" <canvas id=\"myLineChart\"></canvas>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("  var ctx = document.getElementById(\"myLineChart\");\r\n");
      out.write("  var myLineChart = new Chart(ctx, {\r\n");
      out.write("    type: 'line',\r\n");
      out.write("    data: {\r\n");
      out.write("      labels: [\r\n");
      out.write("    \t  ");
for(int i=0;i<hnode.size();i++){
      out.write("\r\n");
      out.write("    \t  \t");
if(i!=0){
      out.write(',');
}
      out.write("\r\n");
      out.write("    \t  \t'");
      out.print(hnode.get(i).get("start_date").asText());
      out.write("'\r\n");
      out.write("    \t  ");
}
      out.write("\r\n");
      out.write("    \t  ],\r\n");
      out.write("      datasets: [\r\n");
      out.write("        {\r\n");
      out.write("          label: '株価',\r\n");
      out.write("          data: [\r\n");
      out.write("        \t  ");
for(int i=0;i<hnode.size();i++){
      out.write("\r\n");
      out.write("      \t  \t");
if(i!=0){
      out.write(',');
}
      out.write("\r\n");
      out.write("      \t  \t");
      out.print(hnode.get(i).get("price").asDouble());
      out.write("\r\n");
      out.write("      \t  ");
}
      out.write("\r\n");
      out.write("        \t  ],\r\n");
      out.write("          borderColor: \"rgba(255,0,0,1)\",\r\n");
      out.write("          backgroundColor: \"rgba(0,0,0,0)\"\r\n");
      out.write("        }\r\n");
      out.write("      ],\r\n");
      out.write("    },\r\n");
      out.write("    options: {\r\n");
      out.write("      title: {\r\n");
      out.write("        display: true,\r\n");
      out.write("        text: '直近");
      out.print(hnode.size());
      out.write("営業日の株価（終値）'\r\n");
      out.write("      },\r\n");
      out.write("      scales: {\r\n");
      out.write("        yAxes: [{\r\n");
      out.write("          ticks: {\r\n");
      out.write("            callback: function(value, index, values){\r\n");
      out.write("              return  value +  '円'\r\n");
      out.write("            }\r\n");
      out.write("          }\r\n");
      out.write("        }]\r\n");
      out.write("      },\r\n");
      out.write("    }\r\n");
      out.write("  });\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("  <!-- チャート終わり -->\r\n");
      out.write("\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write("  <table class=\"attention_point\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th align=\"center\"colspan=\"2\" class=\"point_top\">注目ポイント</th>\r\n");
      out.write("\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">会社のお名前（和）</th>\r\n");
      out.write("   <td>");
      out.print(dnode.get("v-name").asText() );
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">会社のお名前（英）</th>\r\n");
      out.write("   <td>");
      out.print(dnode.get("v-name_en").asText());
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">一年間の成績発表月（決算期）</th>\r\n");
      out.write("   <td>");
      out.print(dnode.get("co_settle_fy_ended").asText());
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">企業の大きさ（時価総額）</th>\r\n");
      out.write("   <td>");
      out.print(dnode.get("marketcap").asText());
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">株主に渡す一部の利益（配当金）</th>\r\n");
      out.write("   <td>");
      out.print(dnode.get("co_settle_dps").asText());
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <th width=\"30%\" class=\"sub_point\">配当利回り</th>\r\n");
      out.write("   <td>");
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write("<table class=\"comment_list\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"point_top\">\r\n");
      out.write("    今日のニュース\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"sub\" id=\"commentword\">\r\n");
if(nnode==null){ 
      out.write("\r\n");
      out.write("\t今日のニュースはありません\r\n");
}else{ 
      out.write('\r');
      out.write('\n');
      out.write('	');
 for(int i=0;i<nnode.size();i++){
      out.write("\r\n");
      out.write("\t\t");
      out.print(nnode.get(i).get("headline").asText() );
      out.write("\r\n");
      out.write("\t\t<!-- 折り畳み展開ポインタ -->\r\n");
      out.write("\t\t<div onclick=\"obj=document.getElementById('open");
      out.print(i );
      out.write("').style; obj.display=(obj.display=='none')?'block':'none';\">\r\n");
      out.write("\t\t<a style=\"cursor:pointer;\">▼ クリックで展開</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!--// 折り畳み展開ポインタ -->\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 折り畳まれ部分 -->\r\n");
      out.write("\t\t<div id=\"open");
      out.print(i );
      out.write("\" style=\"display:none;clear:both;\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!--ここの部分が折りたたまれる＆展開される部分になります。\r\n");
      out.write("\t\t自由に記述してください。-->\r\n");
      out.write("\t\t");
      out.print(nnode.get(i).get("article").asText() );
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!--// 折り畳まれ部分 -->\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t");
} 
      out.write('\r');
      out.write('\n');
} 
      out.write("\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write(" </table>\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" <table class=\"comment_submit\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"point_top\">コメント欄</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <form>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"sub\">\r\n");
      out.write("     <div><textarea name=\"comment\"></textarea></div>\r\n");
      out.write("     <div><input type=\"submit\" value=\"送信\" align=\"center\"></div>\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  </form>\r\n");
      out.write(" </table>\r\n");
      out.write("\r\n");
      out.write(" <table class=\"comment_list\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"point_top\">\r\n");
      out.write("    コメント一覧\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td class=\"sub\" id=\"commentword\">\r\n");
      out.write("    コメント内容\r\n");
      out.write("   </td>\r\n");
      out.write("  </tr>\r\n");
      out.write(" </table>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
