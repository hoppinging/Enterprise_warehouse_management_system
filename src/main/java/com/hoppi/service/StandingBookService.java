package com.hoppi.service;

import com.hoppi.pojo.StandingBook;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface StandingBookService {
    //新增一条台账记录
    int insert(StandingBook standingBook);
    //查看所有台账记录
    default List<StandingBook> select() {
        return this.select(new Timestamp(0), new Timestamp(System.currentTimeMillis()), null);
    };
    //查看一定时间内某一仓库所有台账记录
    List<StandingBook> select(java.sql.Timestamp from, java.sql.Timestamp to, String depo_no);
    //删除所有台账记录
    default int delete(){
        return this.delete(new Timestamp(0), new Timestamp(System.currentTimeMillis()), null);
    };
    //删除一定时间内某一仓库所有台账记录
    int delete( java.sql.Timestamp from, java.sql.Timestamp to, String depo_no);
}
