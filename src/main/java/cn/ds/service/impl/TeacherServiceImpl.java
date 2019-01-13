package cn.ds.service.impl;

import cn.ds.mapper.TeacherMapper;
import cn.ds.pojo.Teacher;
import cn.ds.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher login(String username) {
        return teacherMapper.login(username);
    }

    @Override
    public void deleteManyTeacher(String chk_value) {
        teacherMapper.deleteManyTeacher(chk_value);
    }

    @Override
    public void Upteacer(Teacher teacher) {
        teacherMapper.Upteacer(teacher);
    }


}
