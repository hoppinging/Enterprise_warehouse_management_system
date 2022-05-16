package com.hoppi.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * <p>
 * 创建日期：2022-05-16 13:23
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
public class String2Timestamp {
    public static Timestamp transform(String date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        java.util.Date utilDate = null;
        if (date != null && !date.equals("")){
            try {
                utilDate = simpleDateFormat.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else return null;
        Timestamp timestamp = null;
        if (utilDate != null) {
            timestamp = new Timestamp(utilDate.getTime());
        }
        return timestamp;
    }
}
