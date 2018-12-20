package cn.ds.controller;

import cn.ds.pojo.Exam.ExamInfo;
import cn.ds.pojo.Teacher;
import cn.ds.pojo.Tk.Choice;
import cn.ds.service.ExamService;
import cn.ds.service.TeacherService;
import cn.ds.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
     private ExamService examService;
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
    //保存考试信息
    @RequestMapping("/examInfo")
    public String Create(ExamInfo examInfo, Model model) {
        try {
         examService.insert(examInfo);
            model.addAttribute("message", "保存考试信息系成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/teacher/teahome";
    }
    @RequestMapping("/allexam")
    public String AllExam(Model model){
        List<ExamInfo>examInfos = examService.FindAll();
        model.addAttribute("examInfo",examInfos);
        return "page/admin/exam_info";
    }
    @RequestMapping("/examall")
    public String ExamAll(Model model){
        List<ExamInfo>examInfos = examService.FindAll();
        model.addAttribute("examInfo",examInfos);
        return "page/teacher/exam_info";
    }
    @RequestMapping("/examallstu")
    public String ExamStuAll(Model model){
        List<ExamInfo>examInfos = examService.FindAll();
        model.addAttribute("examInfo",examInfos);
        return "page/student/exam_info";
    }
    @RequestMapping("/upexam")
    public  String UpExam(ExamInfo examInfo) {
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//        sdf.parse(begindate);
//        System.out.println("接受的时间" + begindate);
        examService.UpExaminfo(examInfo);
        return "redirect:allexam.do";
    }
    @RequestMapping("/byexamid")
    @ResponseBody
    public ExamInfo ExamId(@RequestBody ExamInfo examInfo){
        System.out.println("Find" + examInfo.getId());
        ExamInfo examInfos = examService.findById(examInfo.getId() );
        System.out.println("Find" + examInfos.getExamname());
        return examInfos;
    }
    @RequestMapping("/exambegin")
    public String findById(@RequestParam String examname,@RequestParam int exnumber,@RequestParam int  score, Model model) {
        System.out.println("题目数量"+exnumber);
        System.out.println("分数"+score);
        List<Choice>choices = examService.RandId((long) exnumber);
        model.addAttribute("examname",examname);
        model.addAttribute("choice",choices);
        model.addAttribute("score",score);
       return "page/student/exam";
    }
  @RequestMapping("/deleteexam")
  public String DeleteExam(@RequestParam Long id){
        examService.DeleteExam(id);
      return "redirect:allexam.do";
  }

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

}
