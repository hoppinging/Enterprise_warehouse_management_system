package com.hoppi.service;

import com.hoppi.dao.StandingBookMapper;
import com.hoppi.pojo.StandingBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * <p>
 * 创建日期：2022-05-10 14:57
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Service
public class StandingBookServiceImpl implements StandingBookService{
    @Autowired
    private StandingBookMapper standingBookMapper;

    @Override
    public int insert(StandingBook standingBook) {
        return standingBookMapper.insert(standingBook);
    }

    @Override
    public List<StandingBook> select(Timestamp from, Timestamp to, String depo_no) {
        return standingBookMapper.select(from, to, depo_no);
    }

    @Override
    public List<StandingBook> select() {
        return standingBookMapper.select();
    }

    @Override
    public int delete() {
        return standingBookMapper.delete();
    }

    @Override
    public int delete(Timestamp from, Timestamp to, String depo_no) {
        return standingBookMapper.delete(from, to, depo_no);
    }
}
