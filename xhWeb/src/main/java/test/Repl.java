package test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Repl {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String sqlStr="SELECT * FROM XT_XHB WHERE NAME=${NAME}  AND NAME=${NAME} and  YEAR='2013'    and XM LIKE  '%'||#{XM}||'%' AND ID=#{ID}";
		
//		String sqlStr="WHERE XM LIKE  '%'||'胡东东'||'%' AND ID=#{ID}";
		sqlStr=sqlStr.toUpperCase();
		String sql1=sqlStr.substring(0, sqlStr.indexOf("WHERE"));
		System.out.println("1"+sql1);
		String sql2=sqlStr.substring(sqlStr.indexOf("WHERE"),sqlStr.length());
		System.out.println("2"+sql2);
		sql2=sql2.replaceAll("[ ]+", " ");
		System.out.println("22"+sql2);
		if(sql2.indexOf("{")>-1){
			String sql3=sql2.replaceAll("\\s?([A-Za-z]+)\\s?=\\s?(#|\\$)\\{([A-Za-z]+)\\}\\s?(AND)?", "");
			System.out.println("3"+sql3);
			
			String sql4=sql3.replaceAll("\\s?([A-Za-z]+)\\s?LIKE\\s?'%'\\|\\|\\#\\{([A-Za-z]+)\\}\\|\\|'%'\\s?(AND)?", "");
			
			System.out.println("4"+sql4);
		}
		System.out.println("WHERE YEAR='2013' AND".length());
		System.out.println("WHERE YEAR='2013' AND".lastIndexOf("AND"));
	}

}
