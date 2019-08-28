package masui_java;

import java.io.IOException;
import java.util.List;

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
		if(session == null) {
			request.getRequestDispatcher("/masui_jsp/session_timeout.jsp").forward(request, response);
		}

		List<StringBuffer> pageHistory = (List<StringBuffer>)session.getAttribute("pageHistory");
		StringBuffer sb = ((HttpServletRequest)request).getRequestURL();
		pageHistory.add(sb);
		if(pageHistory.size() > 3) {
			pageHistory.remove(0);
		}

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO 自動生成されたメソッド・スタブ

	}

}
