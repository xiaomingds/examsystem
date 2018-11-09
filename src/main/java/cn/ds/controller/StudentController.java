package cn.ds.controller;

import cn.ds.pojo.Student;
import cn.ds.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        Student student = studentService.login(username);
        if(student != null)
        {
            if(student.getPassword().equals(password))
            {
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
}
