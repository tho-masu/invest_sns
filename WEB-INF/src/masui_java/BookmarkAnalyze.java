package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.JsonNode;

import api.AnalyzeDAO;
import api.CompanyAnalyzeBean;
import database.UserBean;

public class BookmarkAnalyze extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserBean loginAccount = (UserBean) session.getAttribute("login_account");

		CompanyAnalyzeBean cabean = getCabean(loginAccount.getPk_id());

		request.setAttribute("cabean", cabean);
		request.getRequestDispatcher("/masui_jsp/bookmark_analyze.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}


	public CompanyAnalyzeBean getCabean(int pk_id)throws ServletException,IOException{

		CompanyAnalyzeBean cabean = null;
		try {
			cabean = AnalyzeDAO.getBookmarkCompanyAnalyze(pk_id);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		JsonNode hnode = cabean.getHnode();
		JsonNode epsNode = cabean.getEpsNode();
		JsonNode incomeNode = cabean.getIncomeNode();

		cabean.setEpsPchgList(getEpsPchgList(epsNode));
		cabean.setIncomePchgList(getIncomePchgList(incomeNode));
		cabean.setGradientList(getGradientList(hnode));

		return cabean;

	}

	public static List<Double> getEpsPchgList(JsonNode epsNode) {
		List<Double> epsPchgList = new ArrayList<Double>();
		for(int i=0;i<epsNode.size();i++) {
			double previous_eps = epsNode.get(i).get("value").get(0).get("co_qtr_settle_eps").asDouble();
			double last_eps = epsNode.get(i).get("value").get(1).get("co_qtr_settle_eps").asDouble();
			epsPchgList.add(100.0 * (last_eps - previous_eps) / Math.abs(previous_eps));
		}
		return epsPchgList;
	}

	public static List<List<Double>> getIncomePchgList(JsonNode incomeNode){
		List<List<Double>> incomePchgList = new ArrayList<List<Double>>();

		for(int i=0;i<incomeNode.size();i++) {
			List<Double> list = new ArrayList<Double>();

			for(int j=0;j<incomeNode.get(i).get("value").size();j++) {
				double pchg = incomeNode.get(i).get("value").get(j).get("co_settle_operating_income_pchg").asDouble();
				list.add(pchg);
			}
			incomePchgList.add(list);
		}
		return incomePchgList;
	}


	public static List<Double> getGradientList(JsonNode hnode){
		List<Double> gradientList = new ArrayList<Double>();

		for(int i=0;i<hnode.size();i++) {
			gradientList.add(calcGradient(hnode.get(i).get("value")));
		}

		return gradientList;
	}

	public static double calcGradient(JsonNode jnode) {
		int n = jnode.size();

		//時間インデックス（0～N）の平均
		double xAve = (n - 1)/2.0;

		//株価（y）の平均を求める
		double ySum = 0.0;
		for(int i=0;i<n;i++) {
			ySum += jnode.get(i).get("price").asDouble();
		}
		double yAve = ySum / n;

		//時間インデックス（0～N）と株価の積（xy）の平均を求める
		double xySum = 0.0;
		for(int i=0;i<n;i++) {
			xySum += i * jnode.get(i).get("price").asDouble();
		}
		double xyAve = xySum / n;

		//x=時間インデックス、y=株価として単回帰分析したときのグラフの傾きを返す
		return (xyAve - xAve * yAve)/ ((n * n - 1)/12);
	}

	public static double calcIntercept(JsonNode jnode) {
		int n = jnode.size();

		//時間インデックス（0～N）の平均
		double xAve = (n - 1)/2.0;

		//株価（y）の平均を求める
		double ySum = 0.0;
		for(int i=0;i<n;i++) {
			ySum += jnode.get(i).get("price").asDouble();
		}
		double yAve = ySum / n;

		//β1ハット
		double b1 = calcGradient(jnode);

		//β0ハットを返す
		return yAve - b1 * xAve;
	}
}

