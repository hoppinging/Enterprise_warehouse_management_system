package com.hoppi.dao;

import com.hoppi.pojo.Cargo;
import com.hoppi.pojo.Material;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MaterialMapper {
    //存在就更新，不存在就插入
    int insertAndUpdate(Cargo cargo);
    //更新总仓记录
    int update(Cargo cargo);
    //查看总仓物料表
    List<Material> selectAll();
    //删除amount为0的物料
    int delete();
}
