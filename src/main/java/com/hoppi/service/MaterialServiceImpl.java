package com.hoppi.service;

import com.hoppi.dao.MaterialMapper;
import com.hoppi.pojo.Cargo;
import com.hoppi.pojo.Material;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 创建日期：2022-05-10 14:51
 *
 * @author Hoppinging
 * @version 1.1
 * @since 1.0
 */
@Service
public class MaterialServiceImpl implements MaterialService{
    @Autowired
    private MaterialMapper materialMapper;

    @Override
    public int insertAndUpdate(Cargo cargo) {
        return materialMapper.insertAndUpdate(cargo);
    }

    @Override
    public int update(Cargo cargo) {
        return materialMapper.update(cargo);
    }

    @Override
    public List<Material> selectAll() {
        return materialMapper.selectAll();
    }

    @Override
    public int delete() {
        return materialMapper.delete();
    }
}
