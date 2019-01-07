package cn.ds.controller;

import cn.ds.pojo.Teacher;
import cn.ds.pojo.Tk.Choice;
import cn.ds.service.ExamService;
import cn.ds.service.TeacherService;
import cn.ds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.util.*;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
     private ExamService examService;
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model,HttpSession session ) {
        Teacher teacher = teacherService.login(username);
        if (teacher != null) {
            if (teacher.getPassword().equals(password)) {
                session.setAttribute("teachersession",teacher);
                return "page/teacher/home";
            } else {
                model.addAttribute("message", "你输入的密码有误");
                return "page/loginInfo";
            }
        }
        else {
            model.addAttribute("message", "用户不存在");
            return "page/loginInfo";
        }
    }




//    @RequestMapping("/byexamid")
//    @ResponseBody
//    public ExamInfo ExamId(@RequestBody ExamInfo examInfo){
//        System.out.println("Find" + examInfo.getId());
//        ExamInfo examInfos = examService.findById(examInfo.getId() );
//        System.out.println("Find" + examInfos.getExamname());
//        return examInfos;
//    }



    @RequestMapping("/stuinfo")
    public  String stuifnopage(){
        return "page/teacher/stuinformation";
    }
    @RequestMapping("/exam")
    public  String Exam(){
        return "page/teacher/examtest";
    }
    @RequestMapping("/findexam")
    public  String findexam(){
        return "redirect:allexam.do";
    }
    @RequestMapping("findstuscore")
    public String FindStuScore(){
        return "page/teacher/student_score";
    }
}
