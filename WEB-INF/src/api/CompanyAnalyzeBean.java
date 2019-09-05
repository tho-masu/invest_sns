package api;

import java.util.ArrayList;
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


	public List<Integer> getTotalEvaluation(){
		List<Integer> totalEvaluation = new ArrayList<Integer>();

		List<Integer> trend = checkTrend(getGradientList());
		List<Integer> eps = checkEps(getEpsPchgList());
		List<Integer> income = checkIncome(getIncomePchgList());

		for(int i=0;i<trend.size();i++) {
			totalEvaluation.add(trend.get(i)+eps.get(i)+income.get(i));
		}

		return totalEvaluation;
	}

	public List<Integer> checkTrend(List<Double> gradientList) {
		List<Integer> trend = new ArrayList<Integer>();
		for(int i=0;i<gradientList.size();i++) {
			double gradient = gradientList.get(i);
			if(gradient <= -0.2){
				trend.add(0);
			}else if(0.2 <= gradient) {
				trend.add(2);
			}else {
				trend.add(1);
			}
		}
		return trend;
	}

	public List<Integer> checkEps(List<Double> epsPchgList){
		List<Integer> eps = new ArrayList<Integer>();
		for(int i=0;i<gradientList.size();i++) {
			double epsPchg = epsPchgList.get(i);
			if(epsPchg <= 0.0){
				eps.add(0);
			}else if(20.0 <= epsPchg) {
				eps.add(2);
			}else {
				eps.add(1);
			}
		}
		return eps;
	}

	public List<Integer> checkIncome(List<List<Double>> incomePchgList){
		List<Integer> income = new ArrayList<Integer>();
		for(int i=0;i<incomePchgList.size();i++) {
			int count = 0;
			for(int j=0;j<incomePchgList.get(i).size();j++){
				if(0 < incomePchgList.get(i).get(j)){
					count++;
				}
			}

			if(count >= 4) {
				income.add(2);
			}else if(count == 3) {
				income.add(1);
			}else {
				income.add(0);
			}
		}
		return income;
	}

}
