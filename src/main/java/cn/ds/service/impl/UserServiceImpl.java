package cn.ds.service.impl;

import cn.ds.mapper.UserMapper;
import cn.ds.pojo.*;
import cn.ds.service.UserService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import java.util.List;

/**
 * @author ds
 *
 */
@Service
public class UserServiceImpl implements UserService {

    //注入
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录的方法
     */
    public User login(String username) {
        return userMapper.login(username);
    }
    //查找所有的老师
    @Override
    public List<Teacher> findTeacherAll() {
        return userMapper.findTeacherAll();
    }
    //x新建老师
    @Override
    public void create(Teacher teacher) {
            userMapper.create(teacher);
    }
    //知识点一级目录
    @Override
    public List<Point1> findPoint1All() {
        return userMapper.findPoint1All();
    }
    @Override
    public void createpoint1(Point1 point1) {
        userMapper.createpoint1(point1);
    }
    @Override
    public void createpoint2(Point2 point2) {
         userMapper.createpoint2(point2);
    }
    @Override
    public List<Point1> Point1All() {
        return userMapper.Point1All();
    }
    @Override
    public List<Choice> findChoiceAll() {
        return userMapper.findChoiceAll();
    }
    @Override
    public void createchoice(Choice choice) {
        userMapper.createchoice(choice);
    }

    @Override
    public Choice findBychId(Long id) {
        return userMapper.findBychId(id);
    }


   /* @Override
    public Point1 selectUserInfoByName(String name) {
        return userMapper.selectUserInfoByName(name);
    }*/

    public List<User> findAll() {
        return null;
    }

    @Override
    public Teacher findById(Long id) {
        return userMapper.findById(id);
    }

    @Override
    public void updatech(Choice choice) {
        userMapper.updatech(choice);
    }

    @Override
    public void deletech(Long id) {
        userMapper.deletech(id);
    }

    @Override
    public List<ReadProgram> findReadprogramAll() {
        List<ReadProgram>readPrograms  = userMapper.findreadprogramAll();
        for(int i = 0;i < readPrograms.size();i++){
            String s = StringEscapeUtils.escapeHtml4(readPrograms.get(i).getContent());
            readPrograms.get(i).setContent(s);
            System.out.println(readPrograms.get(i).getContent());
        }
        return readPrograms;
    }
    public void create(User user) {
    }
    public void delete(Long id) {
        userMapper.delete(id);
    }
    @Override
    public void update(User user) {
    }
    public void update(Teacher teacher) {
        userMapper.update(teacher);
    }
}
