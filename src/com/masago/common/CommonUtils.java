/**
 * Copyright (C) 2018 Tang.
 */
package com.masago.common;

import java.io.IOException;

/**
 * StringUtilsクラス。
 *
 * @author tang
 * @version 1.00 2018/07/26
 *
 */
public class CommonUtils {

	/**
	 * 入力されたデータをBASE64変換する。
	 *
	 * @param in 変換対象データ
	 * @return BASE64文字列
	 * @throws IOException
	 */
	public static boolean checkDateFormat(String inDate) {
		//YYYY/MM/DD
		String regex = "(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})/(((0[13578]|1[02])/(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)/(0[1-9]|[12][0-9]|30))|(02/(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))/02/29)";
		return inDate.matches(regex);
	}
	
	private static int getRandom(int count) {
	    return (int) Math.round(Math.random() * (count));
    }

	public static String getRandomString(int length){
		String string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	    StringBuffer sb = new StringBuffer();
	    int len = string.length();
	    for (int i = 0; i < length; i++) {
	        sb.append(string.charAt(getRandom(len-1)));
	    }
	    return sb.toString();
	}

}
