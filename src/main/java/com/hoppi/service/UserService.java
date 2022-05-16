package com.hoppi.service;

import com.hoppi.pojo.User;

import java.util.List;

public interface UserService {
    //新增用户
    int insert(User user);
    //通过id查询用户密码（用于登录）
    String getPwd(int id);
    User getInfo( int id);
    //查询用户列表
    List<User> select();
    //通过id删除用户
    int delete(int id);
    //通过id修改用户
    int update(int id, User user);
}
