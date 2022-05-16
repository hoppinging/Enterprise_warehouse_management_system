package com.hoppi.dao;

import com.hoppi.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //新增用户
    int insert(User user);
    //通过id查询用户密码（用于登录）
    String getPwd(@Param("id") int id);
    //查询单个用户
    User getInfo(@Param("id") int id);
    //查询用户列表
    List<User> select();
    //通过id删除用户
    int delete(@Param("id") int id);
    //通过id修改用户
    int update(@Param("id") int id, @Param("user") User user);
}
