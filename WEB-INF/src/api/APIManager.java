package api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.StringJoiner;
import java.util.zip.GZIPInputStream;
import java.util.zip.InflaterInputStream;

public class APIManager {
	public static String getData(String str,HashMap<String,String> query) {
		//デプロイする際に下記の設定を切り替える必要あり

		 System.setProperty("http.proxyHost","172.24.2.10");
	     System.setProperty("http.proxyPort","8080");
	     System.setProperty("https.proxyHost","172.24.2.10");
	     System.setProperty("https.proxyPort","8080");
	     System.setProperty("http.nonProxyHosts","localhost|*.nonproxy.com");
	     /*
		 System.setProperty("http.proxyHost","proxy-operation.aim.d.quick.aws");
	     System.setProperty("http.proxyPort","8080");
	     System.setProperty("https.proxyHost","proxy-operation.aim.d.quick.aws");
	     System.setProperty("https.proxyPort","8080");
	     System.setProperty("http.nonProxyHosts","localhost|*.nonproxy.com");
		 */

	     StringBuffer response = new StringBuffer();

		try {
			String path = "https://staging.api.dquick-co.jp/octpath/v1/api/"+str+".json";

			//HashMap<String,String> q = new  HashMap<String,String>();

			//q.put("quote" , "N101/T");
			//q.put("item", "price");
			//q.put("count", "10");
			//q.put("direction","backward");

			// パスにクエリーパラメータを連結してURLを生成

			StringJoiner urltmp = new StringJoiner("&",path + "?", "");
			for (HashMap.Entry<String, String> param : query.entrySet()) {
				urltmp.add(param.getKey() + "=" + param.getValue());
			}
			URL url = new URL(urltmp.toString());

			HttpURLConnection con = null;
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");

			// アクセスキーの設定
			con.setRequestProperty("Authorization", "Bearer 00119c31ab8f86113fbe4c78f3ed76e2733a7d5e176e05b94b5122361ab8234c");
			// gzip圧縮の要求
			con.setRequestProperty("Accept-Encoding", "gzip, deflate");

			// リクエスト送信
			con.connect();

			// HTTPステータス判定
			int status = con.getResponseCode();
			if (status == HttpURLConnection.HTTP_OK) {

				// 期待する応答データに沿って書き変えて下さい

				BufferedReader in = null;
				String enc = con.getContentEncoding();
				if ("gzip".equals(enc)) {
					in = new BufferedReader(new InputStreamReader(new GZIPInputStream(con.getInputStream()), "UTF-8"));
				}
				else if ("deflate".equals(enc)) {
					in = new BufferedReader(new InputStreamReader(new InflaterInputStream(con.getInputStream()), "UTF-8"));
				}
				else {
					in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				}
				String inputLine = null;
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
			}
			if (con != null) {
				con.disconnect();
			}


		}catch(Exception e) {
			e.printStackTrace();
		}

		return response.toString();
	}

	public static String getYutaiData(String str) {
		//取得先は社内ネットワーク内なのでプロキシを経由しないことを明示しないとエラーになる
		System.setProperty("http.nonProxyHosts","localhost|172.22.88.215|*.nonproxy.com");

	     StringBuffer response = new StringBuffer();

		try {
			String path = "http://172.22.88.215:20008/qr/yuutai/imgservice/yuutai.asp?rcode="+str+"&user=1";

			URL url = new URL(path);

			HttpURLConnection con = null;
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");

			// アクセスキーの設定
			//con.setRequestProperty("Authorization", "Bearer 00119c31ab8f86113fbe4c78f3ed76e2733a7d5e176e05b94b5122361ab8234c");
			// gzip圧縮の要求
			//con.setRequestProperty("Accept-Encoding", "gzip, deflate");

			// リクエスト送信
			con.connect();

			// HTTPステータス判定
			int status = con.getResponseCode();
			if (status == HttpURLConnection.HTTP_OK) {

				// 期待する応答データに沿って書き変えて下さい

				BufferedReader in = null;
				String enc = con.getContentEncoding();
				if ("gzip".equals(enc)) {
					in = new BufferedReader(new InputStreamReader(new GZIPInputStream(con.getInputStream()), "Shift_JIS"));
				}
				else if ("deflate".equals(enc)) {
					in = new BufferedReader(new InputStreamReader(new InflaterInputStream(con.getInputStream()), "Shift_JIS"));
				}
				else {
					in = new BufferedReader(new InputStreamReader(con.getInputStream(), "Shift_JIS"));
				}
				String inputLine = null;
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
			}
			if (con != null) {
				con.disconnect();
			}


		}catch(Exception e) {
			e.printStackTrace();
		}

		return response.toString();
	}

}
