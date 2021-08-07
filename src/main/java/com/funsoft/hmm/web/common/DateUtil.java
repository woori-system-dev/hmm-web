package com.funsoft.hmm.web.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 날짜 관련 유틸
 * 
 * @author hgko
 *
 */
public class DateUtil {
	
	private static SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat smallDateFormat = new SimpleDateFormat("yyyy-M-d");
	private static SimpleDateFormat monthFormat = new SimpleDateFormat("MM-dd");
	private static SimpleDateFormat minuteFormat = new SimpleDateFormat("HH:mm");
	private static SimpleDateFormat hourFormat = new SimpleDateFormat("HH");
	
	/**
	 * Date -> String 변환
	 * @return
	 */
	public static String toDateTimeString(Date datetime) {
		return dateTimeFormat.format(datetime);
	}
	
	/**
	 * Calendar -> String 변환
	 * @return
	 */
	public static String toDateTimeString(Calendar calendar) {
		return dateTimeFormat.format(calendar.getTime());
	}

	/**
	 * String -> 날짜로 변환
	 * @param dateTime
	 * @return
	 */
	public static Date toDateTime(String dateTime) {
		try {
			return dateTimeFormat.parse(dateTime);
		} catch (ParseException e) {
			return new Date();
		}
	}
	
	public static Date toDate(String date) {
		try {
			return dateFormat.parse(date);
		} catch (ParseException e) {
			return new Date();
		}
	}
	
	public static String toString(String date) {
		try {
			return dateFormat.format(new SimpleDateFormat("yyyyMMdd").parse(date));
		} catch (ParseException e) {
			return dateFormat.format(new Date());
		}
	}
	
	public static String toDateString(Date date) {
		return dateFormat.format(date);
	}
	
	public static String toSmallDateString(Date date) {
		return smallDateFormat.format(date);
	}
	
	public static String toMonthString(Date date) {
		return monthFormat.format(date);
	}
	
	public static String toHourString(Date date) {
		return hourFormat.format(date);
	}
	
	public static String toMinuteString(Date date) {
		return minuteFormat.format(date);
	}
	
	/**
	 * 일주일전 날짜 가져오기
	 * @param date
	 * @param value
	 * @return
	 */
	public static String getWeekAgeDate(String date, int value) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(toDate(date));
		calendar.add(Calendar.WEEK_OF_MONTH, value);
		return toDateString(calendar.getTime());
	}
	
	/**
	 * 몇달 전 날짜 가져오기
	 * @param date
	 * @param value
	 * @return
	 */
	public static String getMonthAgeDate(String date, int value) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(toDate(date));
		calendar.add(Calendar.MONTH, value);
		return toDateString(calendar.getTime());
	}
}
