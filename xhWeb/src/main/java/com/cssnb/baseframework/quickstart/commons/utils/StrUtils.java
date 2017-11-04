package com.cssnb.baseframework.quickstart.commons.utils;

public class StrUtils {
	
	public static boolean isEmpty(final CharSequence cs) {
        return cs == null || cs.length() == 0;
    }
	
	public static boolean isNotEmpty(final CharSequence cs) {
        return !isEmpty(cs);
    }
}
