package masui_java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Register extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String user_id = request.getParameter("user_id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_confirm = request.getParameter("password_confirm");
		String forwardURL = null;
		String errorMessage = null;
		String isCompany = request.getParameter("is_company");

		try {
			database.UserBean ubean = new database.UserBean(user_id, username,
					password);
			int checkUserId = database.UserDAO.checkUserId(ubean);
			//フォームに入力された文字列のチェック
			if(username == null || username.equals("") || user_id == null || user_id.equals("") ||
					password == null || password.equals("") || password_confirm == null || password_confirm.equals("")){
				//未入力の項目がないかチェック
				errorMessage = "未入力の項目があります";
				throw new RegisterException();
			}else if(checkUserId != 0){
				//checkUserIdはUser_idが重複していないかCheｃｋし、Countなので重複していなければ0を返す
				errorMessage = "そのIDは既に使われています";
				throw new RegisterException();
			}else if(!password.equals(password_confirm) || !isHalfAlphanumeric(password) || password.length() < 6 ){
				//パスワードが確認用と一致しているかチェック
				//パスワードが半角英数になっているかチェック
				//パスワードの長さが6以上になっているかチェック
				errorMessage = "パスワードに誤りがあります";
				throw new RegisterException();
			}else if(!isHalfAlphanumeric(user_id)) {
				errorMessage="ユーザーIDには半角英数しか使えません";
				throw new RegisterException();
			}else if(isCompany != null){
				if(!isHalfNumber(user_id)) {
					errorMessage = "ユーザーIDには半角数字のみを入力してください";
					throw new RegisterException();
				}
			}else if(isCompany == null) {
				if(isHalfNumber(user_id)) {
					errorMessage = "半角数字のみのユーザーIDは登録できません";
					throw new RegisterException();
				}
			}

			// データベース処理
			//ユーザーの登録
			int pk_id = database.UserDAO.register(ubean);
			database.UserDAO.registerIcon(pk_id);
			forwardURL = "/";
			request.getRequestDispatcher(forwardURL).forward(request, response);
			/*if (updateCount < 1) {
				//updateCountではSQL文を実行した数が表示される
				errorMessage = "登録に失敗しました";
				throw new RegisterException();
			} else {
				forwardURL = "/login/login.jsp";
				request.getRequestDispatcher(forwardURL).forward(request, response);
			}*/

		} catch(NumberFormatException e){
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		} catch(RegisterException e){
			request.setAttribute("errorMessage", errorMessage);
			if(isCompany == null) {
				forwardURL = "/register.jsp";
			}else {
				forwardURL = "/company_register.jsp";
			}
			request.getRequestDispatcher(forwardURL).forward(request, response);

			//out.println(errorMessage);
		} catch (Exception e) {// エラー処理
			e.printStackTrace();
		}
	}
	public class RegisterException extends Exception{
	}

    public static boolean isHalfAlphanumeric(String str) {
        return Pattern.matches("^[0-9a-zA-Z]+$", str);
    }

    public static boolean isHalfNumber(String str) {
    	return Pattern.matches("[0-9]+", str);
    }
}
