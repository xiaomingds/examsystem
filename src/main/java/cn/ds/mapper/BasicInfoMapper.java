package cn.ds.mapper;

import cn.ds.pojo.BasicInfo.*;
import com.sun.corba.se.pept.transport.ListenerThread;

import java.lang.Class;
import java.util.List;

public interface BasicInfoMapper {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
  List<Class>findCiAll(Long maid);
    Class findCiId(Long id);
}
