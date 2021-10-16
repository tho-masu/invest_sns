package masui_java;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.node.ArrayNode;

import api.AnalyzeDAO;
import api.CompanyAnalyzeBean;

public class PortfolioOptimize {
	public static void main(String[] args) {
		CompanyAnalyzeBean cabean = null;
		try {
			cabean = AnalyzeDAO.getBookmarkCompanyAnalyze(13);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		ArrayNode hnode = cabean.getHnode();

		List<Double> weight = new ArrayList<Double>();
		weight.add(1.0);
		weight.add(0.0);

		/*
		for(int i=0;i<hnode.size();i++) {
			weight.add(100.0 / hnode.size());
		}
		*/
		for(int w = 0;w<100;w++) {
			weight.set(0, (double)w);
			weight.set(1, 100.0-w);

		double result = returnPerRisk(hnode,weight);
		/*
		label:
		while(true) {

		for(int i=0;i<weight.size();i++) {
			List<Double> tempWeight = weight;
			for(int j=0;j<weight.size();j++) {
				if(i == j) {
					tempWeight.set(j, tempWeight.get(j) + 1.0);
				}else {
					tempWeight.set(j, tempWeight.get(j) - 1.0/(tempWeight.size()-1));
				}
			}

			if(returnPerRisk(hnode,tempWeight) > result) {
				result = returnPerRisk(hnode,tempWeight);
				weight = tempWeight;
				continue label;
			}
		}
		break;
		}
		*/

		System.out.println(weight);
		System.out.println(result);
		System.out.println();
		}
	}

	public static double returnPerRisk(ArrayNode hnode, List<Double> weight){
		List<Double> list = new ArrayList<Double>();
		for(int j=0;j<hnode.get(0).get("value").size();j++){
			double sum = 0.0;
			for(int i=0;i<hnode.size();i++){
				sum += weight.get(i) * hnode.get(i).get("value").get(j).get("price").asDouble();
			}
			list.add(sum);
		}
		List<Double> pchgList = getPricePchgList(list);
		double sd = Math.sqrt(calcVariance(pchgList));

		double expected = (list.get(list.size()-1) - list.get(0)) / list.get(0);

		return expected / sd;
	}


	public static double calcAverage(List<Double> list) {
		double sum =0.0;
		for(double value : list) {
			sum += value;
		}
		return sum / list.size();
	}

	public static double calcVariance(List<Double> list) {
		double average = calcAverage(list);
		double sum = 0.0;
		for(double value : list) {
			sum += (value - average)*(value - average);
		}
		return sum / list.size();

	}

	public static List<Double> getPricePchgList(List<Double> list){
		List<Double> pchgList = new ArrayList<Double>();
		for(int i=0;i<list.size()-1;i++) {
			pchgList.add((list.get(i+1) - list.get(i)) / list.get(i));
		}
		return pchgList;
	}

}
