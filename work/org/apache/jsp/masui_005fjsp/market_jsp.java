/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-16 02:41:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.masui_005fjsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.fasterxml.jackson.databind.JsonNode;
import java.util.List;
import masui_java.StaticList;

public final class market_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.fasterxml.jackson.databind.JsonNode");
    _jspx_imports_classes.add("masui_java.StaticList");
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
      out.write("<title>マーケット</title>\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/reset.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/default.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js\"></script>\r\n");
      out.write("\r\n");

JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
List<String> industryList = StaticList.industryList;

      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<br><br><br><br>\r\n");
      out.write("\r\n");
      out.write("<!-- ヘッダー終わり -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- チャートを入れるテーブルはじめ -->\r\n");
      out.write("\r\n");
      out.write("<table width=\"800px\" align=\"center\">\r\n");
      out.write("<tr><td>\r\n");
      out.write("\r\n");
      out.write("<!-- チャートはじめ -->\r\n");
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
      out.print(hnode.get(i).get("time").asText());
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
      out.write("        text: '日経平均株価（今日の現在までの値動き）'\r\n");
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
      out.write("</td></tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<!-- チャートを入れるテーブル終わり -->\r\n");
      out.write("\r\n");
      out.write("<br><br>\r\n");
      out.write("\r\n");
      out.write("<table align=\"center\" border=\"1\" class=\"list\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<th bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t\t業界\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t\t景気動向\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
 for(String element : industryList){ 
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<a class=\"widelink\" href=\"");
      out.print(request.getContextPath() );
      out.write("/masui_jsp/industry?iname=");
      out.print(element);
      out.write("\"> <p style=\"padding-top: 20px;padding-bottom: 20px\">");
      out.print(element );
      out.write("</p> </a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/img/weather/hare.png\" height=\"50px\">\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
} 
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<br><br><br>\r\n");
      out.write("<footer>\r\n");
      out.write("<center><font size=\"2\">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>\r\n");
      out.write("</footer>\r\n");
      out.write("<br>\r\n");
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
