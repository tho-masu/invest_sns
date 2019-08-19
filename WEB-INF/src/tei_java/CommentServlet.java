package tei_java;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CommentServlet extends HttpServlet{

	public void doPost(HttpServletRequest request,
            HttpServletResponse response)
        throws ServletException,IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int quote = Integer.parseInt(request.getParameter("quote"));
		String comment = request.getParameter("comment");

		String forwardURL = null;







		}
}
