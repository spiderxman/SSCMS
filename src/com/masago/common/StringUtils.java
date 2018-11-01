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
public class StringUtils {

	/**
	 * 入力されたデータをBASE64変換する。
	 *
	 * @param in 変換対象データ
	 * @return BASE64文字列
	 * @throws IOException
	 */
	public static String replaceChar(String strIn, char c) {
		strIn.replace("/", "");
		return strIn;
	}

}
