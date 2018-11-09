package cn.ds.service.impl;

import cn.ds.mapper.StudentMapper;
import cn.ds.pojo.Student;
import cn.ds.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentmapper;
    @Override
    public Student login(String username) {
        return studentmapper.login(username);
    }
}
