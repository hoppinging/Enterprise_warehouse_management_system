package com.hoppi.dao;

import com.hoppi.pojo.Cargo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CargoMapper {
    //存在就更新，不存在就插入
    int insertAndUpdate(Cargo cargo);
    //删除所有amount为0的仓库记录
    int deleteAllZero();
    //更新仓库记录
    int update(Cargo cargo);
    //查看单个仓库所有记录
    List<Cargo> selectDepo(@Param("depo_no") String depo_no);
    //查看所有
    List<Cargo> select();
}
