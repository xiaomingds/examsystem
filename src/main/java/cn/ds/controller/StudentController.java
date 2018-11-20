package cn.ds.controller;


import cn.ds.pojo.Student;
import cn.ds.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.metadata.IIOMetadataNode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model,HttpSession session) {
        Student student = studentService.login(username);
        if(student != null)
        {
            if(student.getPassword().equals(password))
            {

                session.setAttribute("studentsession",student);
                return "page/student/stuhome";
            }
            else {
                model.addAttribute("message", "你输入的密码有误");
                return "page/loginInfo";
            }
        }
        else {
            model.addAttribute("message", "你输入的密码有误");
            return "page/loginInfo";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("student");
        return "index";
    }
    @ResponseBody
    @RequestMapping(value="ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})
    public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {
        System.out.println("这是请求");
         return studentService.ajaxUploadExcel(request, response);
    }
}
