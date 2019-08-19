package tei_java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Login extends HttpServlet{

    public void doPost(HttpServletRequest request,
                        HttpServletResponse response)
                    throws ServletException,IOException{

    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter out = response.getWriter();

	String user_id=request.getParameter("user_id");
    String password=request.getParameter("password");

    String errorMessage = null;
    String forwardURL=null;
    try{
		database.UserBean ubean = new database.UserBean(user_id, password);
		int checkUserId = database.UserDAO.checkUserId(ubean);
		if(user_id == null || user_id.equals("") || password == null || password.equals("")){
			errorMessage = "未入力の項目があります";
			throw new LoginFailedException();
		}else if(checkUserId != 1){
			errorMessage = "そのIDは登録されていません";
			throw new LoginFailedException();
		}


		database.UserBean ubeanAccount = database.UserDAO.checkUserAccount(ubean);
		if(ubean.getPassword().equals(ubeanAccount.getPassword())){
			//セッションを開く(初回)
			HttpSession session = request.getSession();
			//UserBeanクラスでアカウント情報をセッションに登録(ユーザー名、パスワード、ユーザーID)
			session.setAttribute("login_account", ubeanAccount);

			//いいねの初期値　false
			HashMap<Integer, Boolean> nice = new HashMap<Integer, Boolean>();
			session.setAttribute("niceFlag", nice);

			forwardURL= "/home";
			//forwardURL= "/mainpage/home.jsp";
		}else{
			errorMessage = "パスワードに誤りがあります";
			throw new LoginFailedException();
		}

	}catch(LoginFailedException e){
		request.setAttribute("errorMessage", errorMessage);
		forwardURL="/login/login.jsp";
	}catch (Exception e) {
		e.printStackTrace();
	}
	request.getRequestDispatcher(forwardURL).forward(request,response);
    }
    public class LoginFailedException extends Exception{
	}
    public static boolean isHalfAlphanumeric(String str) {
        return Pattern.matches("^[0-9a-zA-Z]+$", str);
    }
}