package cn.ds.mapper;

import cn.ds.pojo.*;

import java.util.List;

/**
 * @author ds
 */
public interface UserMapper {

    User login(String username);
    void create(Teacher teacher);
    void delete(Long id);
    void update(Teacher teacher);
    Teacher findById(Long id);
    List<Teacher> findTeacherAll();
    List<Point1> findPoint1All();
    void createpoint1(Point1 point1);
    void createpoint2(Point2 point2);
    List<Point1>Point1All();
    void createchoice(Choice choice);
     Choice findBychId(Long id);
    List<Choice> findChoiceAll();
     void updatech(Choice choice);
    void deletech(Long id);
    List<ReadProgram> findreadprogramAll();

    //  List<Point1> findPoint();
}
