package com.hoppi.service;

import com.hoppi.pojo.Cargo;

import java.util.List;

public interface CargoService {
    //存在就更新，不存在就插入
    int insertAndUpdate(Cargo cargo);
    //删除所有amount为0的仓库记录
    int deleteAllZero();
    //更新仓库记录
    int update(Cargo cargo);
    //查看单个仓库所有记录
    List<Cargo> selectDepo(String depo_no);
    //查看所有
    List<Cargo> select();
}
