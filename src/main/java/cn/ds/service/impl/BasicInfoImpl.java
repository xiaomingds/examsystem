package cn.ds.service.impl;

import cn.ds.mapper.BasicInfoMapper;
import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;
import cn.ds.service.BasicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasicInfoImpl implements BasicInfoService {
    @Autowired
    private BasicInfoMapper basicInfoMapper;

    @Override
    public List<Semester> findAll() {
        return basicInfoMapper.findAll();
    }

    @Override
    public List<Major> findMaAll(Long seid) {
        return basicInfoMapper.findMaAll(seid);
    }

    @Override
    public List<Class> findCiAll(Long maid) {
        return basicInfoMapper.findCiAll(maid);
    }


}
