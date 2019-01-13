package cn.ds.service;

import cn.ds.pojo.Teacher;


public interface TeacherService {
    Teacher login(String username);
    void deleteManyTeacher(String chk_value);
    void Upteacer(Teacher teacher);

}
