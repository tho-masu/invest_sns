package masui_java;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.UserDAO;

/*
 * 以下のディレクトリはプロジェクトのプロパティ→Tomcat→全般でeclipseのデフォルトのウェブアプリケーションワークが
 * 「work」に設定されているためコンテキストルート直下の「tmp」に一時ファイルを保存するための設定
 * サーバーにデプロイするときは「/tmp」に書き換える必要あり
 */
@MultipartConfig(location="../tmp", maxFileSize=1048576)

public class MypageEdit extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ServletContext context = this.getServletContext();

		String userName = request.getParameter("user_name");
		Part part = request.getPart("icon");
		String investTime = request.getParameter("invest_time");
		String message = request.getParameter("message");

		String pk_id = request.getParameter("pk_id");
		String user_id = request.getParameter("user_id");

		try {
			if(!(userName.equals(""))) {
					UserDAO.updateUserProfile(pk_id, user_id, "username", userName);
			}
			if(!(investTime.equals(""))) {
				UserDAO.updateUserProfile(pk_id, user_id, "invest_time", investTime);
			}
			if(!(message.equals(""))) {
				UserDAO.updateUserProfile(pk_id, user_id, "message", message);
			}
			if(part != null) {
				updateIcon(pk_id,part,context);
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("user_id", user_id);
		request.getRequestDispatcher("/masui_jsp/mypage_changed.jsp").forward(request, response);
	}

	public static void updateIcon(String pk_id,Part part,ServletContext context)throws ServletException,IOException, SQLException{
		String name = getFileName(part);
		String extension = getExtension(name);
		part.write(context.getRealPath("/img/user_icon") + "/" + pk_id +"."+ extension);
		UserDAO.icon_update(pk_id,pk_id+"."+extension);
	}

	private static String getFileName(Part part) {
		  // System.out.println(part.getHeader("Content-Disposition"));
		  // これが出力される-> form-data; name="file"; filename="pic_278.png"
		  String[] splitedHeader = part.getHeader("Content-Disposition").split(";");

		  String fileName = null;
		  for(String item: splitedHeader) {
		      if(item.trim().startsWith("filename")) {
		          fileName = item.substring(item.indexOf('"')).replaceAll("\"", "");
		      }
		  }
		  return fileName;
	}

	public static String getExtension(String fileName) {
	    if (fileName == null) {
	        return null;
	    }

	    // 最後の『 . 』の位置を取得します。
	    int lastDotPosition = fileName.lastIndexOf(".");

	    // 『 . 』が存在する場合は、『 . 』以降を返します。
	    if (lastDotPosition != -1) {
	        return fileName.substring(lastDotPosition + 1);
	    }
	    return null;
	}
}