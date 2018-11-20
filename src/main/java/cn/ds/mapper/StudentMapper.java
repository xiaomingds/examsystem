package cn.ds.mapper;

import cn.ds.pojo.Student;

import java.util.List;


public interface StudentMapper {
    Student login(String username);
    int deleteByPrimaryKey(Long id);
     int insert(Student record);
    int insertSelective(Student record);
    Student selectByPrimaryKey(Long id);
    int updateByPrimaryKeySelective(Student record);
    int updateByPrimaryKey(Student record);
    void insertInfoBatch(List<Student> list);
}
