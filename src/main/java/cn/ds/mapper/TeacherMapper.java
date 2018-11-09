package cn.ds.mapper;

import cn.ds.pojo.Teacher;


public interface TeacherMapper {
    Teacher login(String username);
    void update(Teacher teacher);
}
