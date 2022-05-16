package com.hoppi.service;

import com.hoppi.dao.UserMapper;
import com.hoppi.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 创建日期：2022-05-10 15:04
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public String getPwd(int id) {
        return userMapper.getPwd(id);
    }

    @Override
    public User getInfo(int id) {
        return userMapper.getInfo(id);
    }

    @Override
    public List<User> select() {
        return userMapper.select();
    }

    @Override
    public int delete(int id) {
        return userMapper.delete(id);
    }

    @Override
    public int update(int id, User user) {
        return userMapper.update(id, user);
    }
}
