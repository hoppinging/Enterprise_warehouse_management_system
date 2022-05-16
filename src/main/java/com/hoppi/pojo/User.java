package com.hoppi.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 创建日期：2022-05-06 10:50
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int id;
    private String name;
    private boolean rbac;
    private String pwd;

    public User(String name, boolean rbac, String pwd) {
        this.name = name;
        this.rbac = rbac;
        this.pwd = pwd;
    }
}
