package masui_java;

import java.io.IOException;
import java.sql.SQLException;
import java.util.StringJoiner;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import api.APIManager;
import api.DAO;
import database.YutaiDAO;

public class Yutai {
	public static void main(String[] args) {
		try {
			YutaiDAO.deleteYutaiInfo();
		} catch (SQLException e2) {
			// TODO 自動生成された catch ブロック
			e2.printStackTrace();
		}
		JsonNode nikkei225 = DAO.getTopix();
		int ten_count = 0;
		StringJoiner joiner = new StringJoiner(",","","");
		ObjectMapper mapper = new ObjectMapper();

		for(int i=0;i<nikkei225.size();i++) {
			joiner.add(nikkei225.get(i).get("securities_code").asText());
			ten_count++;
			if(ten_count >= 10) {
				String result = APIManager.getYutaiData(joiner.toString());
				result = substring(result);
				ten_count = 0;
				joiner = new StringJoiner(",","","");

				JsonNode node = null;
				try {
					node = mapper.readTree(result);
				} catch (IOException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}

				try {
					YutaiDAO.insertYutaiInfo(node);
				} catch (SQLException e1) {
					// TODO 自動生成された catch ブロック
					e1.printStackTrace();
				}

				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		}

		if(ten_count != 0) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}

			String result = APIManager.getYutaiData(joiner.toString());
			result = substring(result);
			ten_count = 0;

			JsonNode node = null;
			try {
				node = mapper.readTree(result);
			} catch (IOException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}

			try {
				YutaiDAO.insertYutaiInfo(node);
			} catch (SQLException e1) {
				// TODO 自動生成された catch ブロック
				e1.printStackTrace();
			}

		}
	}

	public static String substring(String str) {
		int length = str.length();
		str = str.substring(1, length-2);
		return str;
	}
}
/*
{
	"TCODE":"8233",
	"WRITER":"02/末、08/末",
	"TITLE":"　<BR>≪優待内容≫<BR>　『株主優待カード』発行<BR>　&nbsp;100株から500株未満所有の株主の「株主優待カード」に下表の<BR>　&nbsp;とおり利用限度額を設ける。<BR>　　[所有株式数]　　　　[利用限度額(6ヶ月間)]<BR>　　100株以上500株未満　　30万円<BR>　　500株以上　　　　　　&nbsp;なし<BR>　<BR>　(01)優待カードの利用により、高島屋各店での割引対象商品<BR>　　　の買物につき、10％（1円未満切り捨て）を割引。<BR>　(02)支払は、現金、当社の商品券、タカシマヤバラカード、<BR>　　　タカシマヤギフトカード、全国百貨店共通商品券、百貨<BR>　　　店ギフトカード、友の会買物カード（いよてつ高島屋除<BR>　　　く）、ギフト券（クレジット会社等発行）、タカシマヤ<BR>　　　カード（ゴールド）・タカシマヤカード・タカシマヤセ<BR>　　　ゾンカード、外商お得意様用の各カードが利用できる。<BR>　(03)他の優待割引、ポイントサービスとの併用はできない。<BR>　　　クレジットカードでの支払い時は、クレジットカードの<BR>　　　ポイントはつかない。<BR>　(04)優待カードを持参しない場合は、割引できない。<BR>　(05)割引対象外の品目、ブランドがある。<BR>　　　また、各店で特に指定する売場・商品等は割引対象外。<BR>　(06)代金引き換え配達の利用方法は、通信販売又は売場での<BR>　　　買物で、注文時に優待カード利用の旨を申し出た場合に<BR>　　　限り、商品配達時に代金引き換えの支払い方法で、優待<BR>　　　カードを利用できる。（ジェイアール名古屋高島屋、<BR>　　　いよてつ高島屋を除く）<BR>　(07)オンラインストアでの支払い方法は、コンビニエンスス<BR>　　　トア、ネット銀行、ペイジー（金融機関ATM等）タカシマヤ<BR>　　　プラチナデビットカード、タカシマヤカード（ゴールド）、<BR>　　　タカシマヤカード、タカシマヤセゾンカード、外商お得意様<BR>　　　用の各カード及び友の会買物カードでの支払いになる。<BR>　　　(注)オンラインストア及び通信販売の支払いにおいて、<BR>　　　　　友の会買物カードを利用する場合は、事前に高島屋<BR>　　　　　各店友の会窓口（いよてつ高島屋を除く）、または<BR>　　　　　オンラインストア（マイページ）にて「認証コード」の<BR>　　　　　登録が必要。<BR>　(08)優待カードは株主本人と国内居住の家族が利用できる。<BR>　(09)優待カードは他人に譲渡・売買・貸与等をした場合は無<BR>　　　効とする。（ただし、上記(08)の場合を除く）<BR>　(10)優待カードを紛失した場合、再発行はしない。<BR>　(11)優待カードの分割発行はしない。<BR>　(12)優待カードは高温多湿な場所や、磁気を帯びたもの（テ<BR>　　　レビ・オーディオ機器・冷蔵庫等）の近くに置かないこと。<BR>　<BR>【高島屋文化催の無料入場】<BR>　株主優待カードの提示により3名まで高島屋各店で開催する<BR>　有料文化催に無料で入場できる。<BR>　文化催の内容は、新聞広告や当社のホームページで確認する<BR>　か、各店に問い合わせること。<BR>　<BR>＜郵送時期及び有効期間＞<BR>　2月末日現在：5月下旬（定時株主総会終了後）に郵送<BR>　　　　　　&nbsp;　優待カード到着日より同年11月30日まで有効<BR>　8月31日現在：11月下旬に郵送<BR>　　　　　　&nbsp;　優待カード到着日より翌年5月31日まで有効<BR>　<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2018年8月29日現在）<BR>",
	"MONTH":"2・8月",
	"DOCID":"2435",
	"CLASS":"K",
	"RECDATE":"2018/08/29 15:00:19",
	"SUBFLD":"2月、8月",
	"FILETEXTBOXIMG(0)":"",
	"FILETEXTBOXIMG_TX(0)":"",
	"FILETEXTBOXIMG(1)":"",
	"FILETEXTBOXIMG_TX(1)":"",
	"FILETEXTBOXIMG(2)":"",
	"FILETEXTBOXIMG_TX(2)":"",
	"FILETEXTBOXIMG(3)":"",
	"FILETEXTBOXIMG_TX(3)":"",
	"FILETEXTBOXIMG(4)":"",
	"FILETEXTBOXIMG_TX(4)":"",
	"FILETEXTBOXIMG(5)":"",
	"FILETEXTBOXIMG_TX(5)":"",
	"FILETEXTBOXIMG(6)":"",
	"FILETEXTBOXIMG_TX(6)":"",
	"FILETEXTBOXIMG(7)":"",
	"FILETEXTBOXIMG_TX(7)":"",
	"FILETEXTBOXIMG(8)":"",
	"FILETEXTBOXIMG_TX(8)":"",
	"FILETEXTBOXIMG(9)":"",
	"FILETEXTBOXIMG_TX(9)":"",
	"line_no":7
}
*/
