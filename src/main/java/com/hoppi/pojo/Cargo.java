package com.hoppi.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * <p>
 * 创建日期：2022-05-06 10:59
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cargo {
    private int art_no;
    private String depo_no;
    private String name;
    private int amount;
    private BigDecimal unit_price;
}
