/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-15 02:57:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.masui_005fjsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.fasterxml.jackson.databind.node.ArrayNode;

public final class industry_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("com.fasterxml.jackson.databind.node.ArrayNode");
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
      out.write("<title>業界</title>\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/reset.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/default.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

ArrayNode anode = (ArrayNode)request.getAttribute("anode");
String iname = (String)request.getAttribute("iname");

      out.write("\r\n");
      out.write("<form action=\"");
      out.print(request.getContextPath() );
      out.write("/masui_jsp/industry\" method=\"GET\">\r\n");
      out.write("業界フィルタ：<select name=\"iname\">\r\n");
      out.write("<option value=\"全銘柄\">（フィルタ解除）</option>\r\n");
      out.write("<option value=\"水産・農林業\">水産・農林業</option>\r\n");
      out.write("<option value=\"鉱業\">鉱業</option>\r\n");
      out.write("<option value=\"建設業\">建設業</option>\r\n");
      out.write("<option value=\"食料品\">食料品</option>\r\n");
      out.write("<option value=\"繊維製品\">繊維製品</option>\r\n");
      out.write("<option value=\"パルプ・紙\">パルプ・紙</option>\r\n");
      out.write("<option value=\"化学\">化学</option>\r\n");
      out.write("<option value=\"医薬品\">医薬品</option>\r\n");
      out.write("<option value=\"石油石炭製品\">石油石炭製品</option>\r\n");
      out.write("<option value=\"ゴム製品\">ゴム製品</option>\r\n");
      out.write("<option value=\"ｶﾞﾗｽ土石製品\">ｶﾞﾗｽ土石製品</option>\r\n");
      out.write("<option value=\"鉄鋼\">鉄鋼</option>\r\n");
      out.write("<option value=\"非鉄金属\">非鉄金属</option>\r\n");
      out.write("<option value=\"金属製品\">金属製品</option>\r\n");
      out.write("<option value=\"機械\">機械</option>\r\n");
      out.write("<option value=\"電気機器\">電気機器</option>\r\n");
      out.write("<option value=\"輸送用機器\">輸送用機器</option>\r\n");
      out.write("<option value=\"精密機器\">精密機器</option>\r\n");
      out.write("<option value=\"その他製品\">その他製品</option>\r\n");
      out.write("<option value=\"電気・ガス業\">電気・ガス業</option>\r\n");
      out.write("<option value=\" 陸運業\"> 陸運業</option>\r\n");
      out.write("<option value=\"海運業\">海運業</option>\r\n");
      out.write("<option value=\"空運業\">空運業</option>\r\n");
      out.write("<option value=\"倉庫運輸関連\">倉庫運輸関連</option>\r\n");
      out.write("<option value=\"情報・通信業\">情報・通信業</option>\r\n");
      out.write("<option value=\"卸売業\">卸売業</option>\r\n");
      out.write("<option value=\"小売業\">小売業</option>\r\n");
      out.write("<option value=\"銀行業\">銀行業</option>\r\n");
      out.write("<option value=\"証券商品先物\">証券商品先物</option>\r\n");
      out.write("<option value=\"保険業\">保険業</option>\r\n");
      out.write("<option value=\"その他金融業\">その他金融業</option>\r\n");
      out.write("<option value=\"不動産業\">不動産業</option>\r\n");
      out.write("<option value=\"サービス業\">サービス業</option>\r\n");
      out.write("</select>\r\n");
      out.write("<input type=\"submit\" value=\"GO！\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  <table border=\"2\">\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>\r\n");
      out.write("        業界：");
      out.print(iname );
      out.write("\r\n");
      out.write("      </td>\r\n");
      out.write("      ");
      out.write("\r\n");
      out.write("      <td>\r\n");
      out.write("        <img src=\"\">\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  <table>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>\r\n");
      out.write("        業界概要\r\n");
      out.write("      </td>\r\n");
      out.write("      ");
      out.write("\r\n");
      out.write("      <td>\r\n");
      out.write("        <img src=\"\">\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  <table border=\"2\">\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th align=\"center\" colspan=\"3\">\r\n");
      out.write("        <b>おすすめ企業</b>\r\n");
      out.write("      </th>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("    \t<td>\r\n");
      out.write("    \t\t<b>企業名</b>\r\n");
      out.write("    \t</td>\r\n");
      out.write("    \t<td>\r\n");
      out.write("    \t\t<b>証券コード</b>\r\n");
      out.write("    \t</td>\r\n");
      out.write("    \t<td>\r\n");
      out.write("    \t\t<b>株価</b>\r\n");
      out.write("    \t</td>\r\n");
      out.write("    </tr>\r\n");
for(int i=0;i<anode.size();i++){ 
      out.write("\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>\r\n");
      out.write("      \t<a href=\"");
      out.print(request.getContextPath() );
      out.write("/masui_jsp/company?quote=");
      out.print(anode.get(i).get("securities_code").asText() );
      out.write('"');
      out.write('>');
      out.print(anode.get(i).get("v-name").asText() );
      out.write("</a>\r\n");
      out.write("      </td>\r\n");
      out.write("      <td>\r\n");
      out.write("\t\t");
      out.print(anode.get(i).get("securities_code").asText() );
      out.write("\r\n");
      out.write("      </td>\r\n");
      out.write("      <td>\r\n");
      out.write("      \t");
      out.print(anode.get(i).get("price").asInt() );
      out.write("円\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
} 
      out.write("\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write(" <table border=\"1\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td>コメント欄</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <form>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>\r\n");
      out.write("       <textarea name=\"comment\" rows=\"4\" cols=\"40\"></textarea>\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>\r\n");
      out.write("       <input type=\"submit\" value=\"送信\">\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </form>\r\n");
      out.write(" </table>\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" <table border=\"1\" width=\"500\">\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td>コメント</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("  <br><br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
