package cn.ds.service;

import cn.ds.pojo.Student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface StudentService {
   Student login(String username);
   String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response);
}
