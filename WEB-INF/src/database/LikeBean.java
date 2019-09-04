package database;

import java.sql.SQLException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

import api.DAO;

public class LikeBean {

	private int count,quote;

	public LikeBean() { }

	public LikeBean(int count,int quote) {
		this.count=count;
		this.quote=quote;

	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getQuote() {
		return quote;
	}

	public void setQuote(int quote) {
		this.quote = quote;
	}

	   public ArrayNode getLlist(){
			ObjectMapper mapper = new ObjectMapper();
	               ArrayNode llist = mapper.createArrayNode();

	           try{
	               llist=DAO.getLikeList();
	            } catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			return llist;
		}

}
