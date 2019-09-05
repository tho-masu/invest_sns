package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import api.DAO;
import database.CommentBean;
import database.IndustryBean;

public class Market extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		JsonNode hnode = DAO.getNikkei225IntradayHistorical();
		JsonNode nnode = DAO.getHeadline();
		List<IndustryBean> ilist = null;
		try {
			ilist = DAO.getIndustryList();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		//コメント一覧を取ってくる
		List<CommentBean> clist = null;
		try {
			clist = DAO.getMarketCommentList();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
		}


		ObjectMapper mapper = new ObjectMapper();
	    ArrayNode llist = mapper.createArrayNode();

		   try{
		        llist=DAO.getLikeList();
		       } catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}



		request.setAttribute("ilist", ilist);
		request.setAttribute("hnode", hnode);
		request.setAttribute("clist", clist);
		request.setAttribute("llist",llist);
		request.setAttribute("nnode", nnode);
		request.getRequestDispatcher("/masui_jsp/market.jsp").forward(request, response);

	}
}