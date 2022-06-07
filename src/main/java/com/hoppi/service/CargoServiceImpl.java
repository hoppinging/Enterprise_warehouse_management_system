package com.hoppi.service;

import com.hoppi.dao.CargoMapper;
import com.hoppi.pojo.Cargo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 创建日期：2022-05-10 14:46
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Service
public class CargoServiceImpl implements CargoService{
    @Autowired
    private CargoMapper cargoMapper;

    @Override
    public int insertAndUpdate(Cargo cargo) {
        return cargoMapper.insertAndUpdate(cargo);
    }

    @Override
    public int deleteAllZero() {
        return cargoMapper.deleteAllZero();
    }

    @Override
    public int update(Cargo cargo) {
        return cargoMapper.update(cargo);
    }

    @Override
    public List<Cargo> selectDepo(String depo_no) {
        return cargoMapper.selectDepo(depo_no);
    }
    @Override
    public List<Cargo> select() {
        return cargoMapper.select();
    }
}
