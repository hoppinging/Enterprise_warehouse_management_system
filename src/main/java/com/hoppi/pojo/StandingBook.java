package com.hoppi.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * <p>
 * 创建日期：2022-05-06 10:55
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StandingBook {
    private Timestamp time_stamp;
    private String depo_no;
    private int art_no;
    //1入库 0出库
    private boolean state;
    private int amount;
    private BigDecimal unit_price;
    private BigDecimal total;
    private String target;

    public StandingBook(String depo_no, int art_no, boolean state, int amount, BigDecimal unit_price, BigDecimal total, String target) {
        this.time_stamp = null;
        this.depo_no = depo_no;
        this.art_no = art_no;
        this.state = state;
        this.amount = amount;
        this.unit_price = unit_price;
        this.total = total;
        this.target = target;
    }
}
