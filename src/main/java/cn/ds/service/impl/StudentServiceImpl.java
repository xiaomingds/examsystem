package cn.ds.service.impl;

import cn.ds.mapper.StudentMapper;
import cn.ds.pojo.Student;
import cn.ds.service.StudentService;
import cn.ds.util.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentmapper;

    @Override
    public Student login(String username) {
        return studentmapper.login(username);
    }

    public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response){
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("file");

        System.out.println("得到数据文件");
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("加载流");
        List<List<Object>> listob = null;
        try {
            System.out.println("加载流");
            listob = new ExcelUtils().getBankListByExcel(in,file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            System.out.println("遍历" + listob.get(i));
            Student vo = new Student();
            Student j = null;

            try {
                //j = studentmapper.selectByPrimaryKey(Long.valueOf());
                j = studentmapper.selectByPrimaryKey(Long.valueOf(String.valueOf(lo.get(0))));
            } catch (NumberFormatException e) {
                // TODO Auto-generated catch block
              //  System.out.println("没有新增");
            }

            //vo.setId(Long.valueOf(String.valueOf(lo.get(0))));
            vo.setUsername(String.valueOf(lo.get(0)));
            String password = String.valueOf(lo.get(2));

            System.out.println("密码" + password);
            vo.setPassword(password);
            vo.setClassname(String.valueOf(lo.get(1)));
            vo.setNum(String.valueOf(lo.get(2)));
            if(j == null)
            {
                studentmapper.insert(vo);
            }
            else
            {
                studentmapper.updateByPrimaryKey(vo);
            }
        }
        return "success";
    }
    @Override
    public List<Student> ByClass(String classname) {
        return studentmapper.ByClass(classname);
    }

    @Override
    public void deleteStudent(String num) {
        studentmapper.deleteStudent(num);
    }

    @Override
    public void UpStudent(Student student) {
        studentmapper.UpStudent(student);
    }

    @Override
    public Student selectByPrimaryKey(Long id) {
        return studentmapper.selectByPrimaryKey(id);
    }

    @Override
    public void CreatStu(Student student) {
        studentmapper.CreatStu(student);
    }

    @Override
    public Student ByNum(String num) {
        return studentmapper.ByNum(num);
    }

    @Override
    public void Updatestu(Student student) {
        studentmapper.Updatestu(student);
    }

    @Override
    public List<Student> AllStudent(List<Long> longList) {
        return studentmapper.AllStudent(longList);
    }
}
