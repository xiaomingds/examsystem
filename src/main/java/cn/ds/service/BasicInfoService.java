package cn.ds.service;

import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;

import java.util.List;

public interface BasicInfoService {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
    List<Class>findCiAll(Long maid);

}
