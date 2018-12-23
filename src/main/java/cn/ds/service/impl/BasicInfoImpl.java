package cn.ds.service.impl;

import cn.ds.mapper.BasicInfoMapper;
import cn.ds.pojo.BasicInfo.Blass;
import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;
import cn.ds.pojo.Student;
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
    public List<Blass> findCiAll(Long maid) {
        return basicInfoMapper.findCiAll(maid);
    }

    @Override
    public void CreateSemester(Semester semester) {
        basicInfoMapper.CreateSemester(semester);
    }
 //批量删除
    @Override
    public Integer deleteSemester(int[] id_arr) {
        return basicInfoMapper.deleteSemester(id_arr);
    }

    @Override
    public void CreateMajor(Major major) {
        basicInfoMapper.CreateMajor(major);
    }

    @Override
    public void CreateBlass(Blass blass) {
          basicInfoMapper.CreateBlass(blass);
    }

    @Override
    public void CreateStudent(Student student) {
        basicInfoMapper.CreateStudent(student);
    }


    @Override
    public List<Student> findClass(String classname) {
        return basicInfoMapper.findClass(classname);
    }

    @Override
    public void DeleteClass(String cname) {
        basicInfoMapper.DeleteClass(cname);
    }

    @Override
    public void DeleteMajor(Long maid) {
        basicInfoMapper.DeleteMajor(maid);
    }

    @Override
    public void DeleteYear(Long seid) {
        basicInfoMapper.DeleteYear(seid);
    }


}
