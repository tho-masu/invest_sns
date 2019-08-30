package api;

import com.fasterxml.jackson.databind.JsonNode;

public class CompanyAnalyzeBean {
	//JsonNodeの中のフィールドとしては以下のようなデータが含まれているというメモ
	/*
	private String v_name,v_name_en,co_settle_fy_ended;
	private double price,co_per,co_settle_roe,marketcap,co_settle_dps,co_settle_dividend_payout,co_qtr_settle_eps(対前期比計算用),co_settle_operating_income_pchg(過去5年間集計用);
	*/
	JsonNode dnode,epsNode,incomeNode;



	public CompanyAnalyzeBean(){
	}

	public CompanyAnalyzeBean(JsonNode dnode,JsonNode epsNode,JsonNode incomeNode) {
		this.dnode = dnode.deepCopy();
		this.epsNode = epsNode.deepCopy();
		this.incomeNode = incomeNode.deepCopy();
	}


	public JsonNode getDnode() {
		return dnode;
	}

	public JsonNode getEpsNode() {
		return epsNode;
	}

	public JsonNode getIncomeNode() {
		return incomeNode;
	}

}
