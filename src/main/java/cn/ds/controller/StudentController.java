package cn.ds.controller;

import cn.ds.pojo.Exam.Score;
import cn.ds.pojo.Student;
import cn.ds.service.ExamService;
import cn.ds.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
   @Autowired
    private ExamService examService;
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

    @RequestMapping("/savescore")
    public  String SaveScore(@RequestParam int allscore, @RequestParam String examname,Model model){
         System.out.println(allscore);
         System.out.println(examname);
         //examService.CreateScore(score);
         model.addAttribute("score",allscore);
          return "page/student/score";
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