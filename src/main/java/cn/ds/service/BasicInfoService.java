package cn.ds.service;

import cn.ds.pojo.BasicInfo.Blass;
import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;
import cn.ds.pojo.Student;

import java.util.List;

public interface BasicInfoService {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
    List<Blass>findCiAll(Long maid);
    void CreateSemester(Semester semester);
    Integer deleteSemester(int[] id_arr);//批量删除
    void CreateMajor(Major major);
    void CreateBlass(Blass blass);
    void CreateStudent(Student student);
    List<Student>findClass(String classname);
}
