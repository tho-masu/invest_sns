package api;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;

public class CompanyAnalyzeBean {
	//JsonNodeの中のフィールドとしては以下のようなデータが含まれているというメモ
	/*
	private String v_name,v_name_en,co_settle_fy_ended;
	private double price,co_per,co_settle_roe,marketcap,co_settle_dps,co_settle_dividend_payout,co_qtr_settle_eps(対前期比計算用),co_settle_operating_income_pchg(過去5年間集計用);
	*/
	private JsonNode dnode,epsNode,incomeNode;
	private ArrayNode hnode;
	private List<Double> gradientList,epsPchgList,bookmarkPortfolio;
	private List<List<Double>> incomePchgList;


	public CompanyAnalyzeBean(){
	}

	public CompanyAnalyzeBean(JsonNode dnode,ArrayNode hnode,JsonNode epsNode,JsonNode incomeNode) {
		this.dnode = dnode.deepCopy();
		this.hnode = hnode.deepCopy();
		this.epsNode = epsNode.deepCopy();
		this.incomeNode = incomeNode.deepCopy();
	}


	public JsonNode getDnode() {
		return dnode;
	}

	public ArrayNode getHnode() {
		return hnode;
	}

	public JsonNode getEpsNode() {
		return epsNode;
	}

	public JsonNode getIncomeNode() {
		return incomeNode;
	}

	public List<Double> getGradientList() {
		return gradientList;
	}

	public void setGradientList(List<Double> gradientList) {
		this.gradientList = gradientList;
	}

	public List<Double> getEpsPchgList() {
		return epsPchgList;
	}

	public void setEpsPchgList(List<Double> epsPchgList) {
		this.epsPchgList = epsPchgList;
	}

	public List<List<Double>> getIncomePchgList() {
		return incomePchgList;
	}

	public void setIncomePchgList(List<List<Double>> incomePchgList) {
		this.incomePchgList = incomePchgList;
	}

	public List<Double> getBookmarkPortfolio() {
		return bookmarkPortfolio;
	}

	public void setBookmarkPortfolio(List<Double> bookmarkPortfolio) {
		this.bookmarkPortfolio = bookmarkPortfolio;
	}

}
