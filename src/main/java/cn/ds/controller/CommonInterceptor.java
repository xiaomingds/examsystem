package cn.ds.controller;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//拦截器
public class CommonInterceptor extends HandlerInterceptorAdapter {
 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
     request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
     String name =  (String) request.getSession().getAttribute("studentsession");
     if(name == null || name==""){
         request.getRequestDispatcher("index.jsp").forward(request, response);
         return false;
     }else
         return true;
 }
}

