package cn.ds.controller;

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
import java.util.List;

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
                return "page/student/home";
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
    @RequestMapping("studentup")
    public String UpStudent(@RequestParam String username,Model model){
        Student student = studentService.login(username);
        model.addAttribute("student",student);
      return "page/student/uppassword";
    }
    @RequestMapping("upstudent")
    public String UpStudent(Student student){
        studentService.Updatestu(student);
        return "page/student/home";
    }
    @ResponseBody
   @RequestMapping("/byclassname")
   public List<Student> ByClass(@RequestParam String classname){
        //如果使用注解@RequestBody  接收到的classname = ( classname =  1601312)
        System.out.println("查找的班级学生" + classname);
       List<Student>students = studentService.ByClass(classname);
       return students;
   }
    @RequestMapping("detelestu")
    @ResponseBody
    public String DeleteStu( String num){
        System.out.println("删除的id" +num);
        studentService.deleteStudent(num);
        return num;
    }
    @RequestMapping("upstu")
    @ResponseBody
    public Student UpStu(Student student){
        studentService.UpStudent(student);
        return student;
    }
    @RequestMapping("/creatstu")
    public String CreatStu(Student student){
        student.setPassword(student.getNum());
        studentService.CreatStu(student);
        return "redirect:byclassname.do?classname="+student.getClassname();
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
    @RequestMapping("/byId")
    public  Student FindId(@RequestParam Long id){
        Student student = studentService.selectByPrimaryKey(id);
        return student;
    }

    @ResponseBody
    @RequestMapping(value="ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})
    public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {
         return studentService.ajaxUploadExcel(request, response);
    }
}

