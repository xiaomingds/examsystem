package cn.ds.controller;

import cn.ds.pojo.Teacher;
import cn.ds.pojo.User;
import cn.ds.service.TeacherService;
import cn.ds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    TeacherService teacherService;
    //添加管理员
    @RequestMapping(value = "/createadmin")
    public String create(User user, Model model) {
        try {
            userService.CreateAdmin(user);
            model.addAttribute("message", "创建管理员成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/login";
    }



    @RequestMapping("/login")
    public  String stuifnopage(){
        return "page/login";
    }
    @RequestMapping("/register")
    public  String AdminRegister(){
        return "page/register";
    }
    @RequestMapping("findstuscore")
    public String FindStuScore(){
        return "page/admin/student_score";
    }
}
