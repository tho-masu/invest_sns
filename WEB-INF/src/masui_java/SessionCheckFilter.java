package masui_java;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO 自動生成されたメソッド・スタブ
		HttpSession session = ((HttpServletRequest)request).getSession(false);
		if(session != null) {
			if(session.getAttribute("login_account") == null) {
				request.getRequestDispatcher("/main_content/account_notfound.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("/main_content/session_timeout.jsp").forward(request, response);
		}

		/*List<StringBuffer> pageHistory = (List<StringBuffer>)session.getAttribute("pageHistory");
		StringBuffer sb = ((HttpServletRequest)request).getRequestURL();
		pageHistory.add(sb);
		if(pageHistory.size() > 3) {
			pageHistory.remove(0);
		}*/

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO 自動生成されたメソッド・スタブ

	}

}
