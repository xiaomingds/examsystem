package cn.ds.controller;

import cn.ds.pojo.Exam.*;
import cn.ds.pojo.Teacher;
import cn.ds.service.ExamService;
import cn.ds.service.TeacherService;
import cn.ds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ExamService examService;
    @Autowired
    private UserService userService;
    //2019.1.3添加
    @RequestMapping("/addexam")
    public  String addexam(Model model){
        List<Teacher> teachers = userService.findTeacherAll();
        model.addAttribute("teacher",teachers);
        return "page/teacher/addexam";
    }

    @RequestMapping("/examadd") //添加考试
    public  String examadd(ExamInformation examInformation){
        examService.CreateExam(examInformation);
        List<PaperJudge>paperJudges = examService.RandJudge((long) examInformation.getJudgenum(),examInformation.getChaptertwo());
        List<PaperChoice>paperChoices = examService.RandChoice((long) examInformation.getChoicenum(),examInformation.getChaptertwo());
        System.out.println("返回的id" + examInformation.getId());
         for (int i = 0;i<paperChoices.size();i++){
             System.out.println("生成的题目" +paperChoices.get(i).getContent());
             paperChoices.get(i).setExamid(examInformation.getId());
         }
         examService.insertRandChoice(paperChoices);
         System.out.println("选择题生成成功");
        for (int i = 0;i<paperJudges.size();i++){
            System.out.println("生成的题目" +paperJudges.get(i).getContent());
            paperJudges.get(i).setExamid(examInformation.getId());
        }
      examService.insertRandJudge(paperJudges);
        System.out.println("判断题生成成功");
        return "redirect:examall.do";
    }
    @RequestMapping("/examall")
    public String ExamAll(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/teacher/exam_info";
    }
    //管理员查询
    @RequestMapping("/allexam")
    public String AllExam(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/admin/exam_info";
    }
    //学生查询
    @RequestMapping("/examallstu")
    public String ExamStuAll(Model model,@RequestParam int studentid){
        List<ExamInformation>examInfos = examService.AllExam();
        List<ExamHistory>examHistories =examService.ByStudentid(studentid);
          for(int i = 0;i < examInfos.size();i++){
              for(int j = 0;j < examHistories.size();j++){
                  if (examHistories.get(j).getExamid() == examInfos.get(i).getId()){
                      System.out.println("已经考的id +" + examHistories.get(j).getExamid()+ "考试信息的id "+ examInfos.get(i).getId());
                      examInfos.remove(examInfos.get(i));
                      break;
                  }
              }
          }
        model.addAttribute("examInfo",examInfos);
        return "page/student/exam_info";
    }


    @RequestMapping("exampaper")
    public String ExamPaper(@RequestParam int examid, Model model){
        System.out.println("试卷id " + examid);
        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamInformation examInformation = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo", examInformation);
        return "page/student/exam_paper";
    }
    @RequestMapping("saveexam")
    public String SaveExam(@RequestParam int examid,@RequestParam long studentid,
                           @RequestParam String[] answerchoice,@RequestParam String[] answerjudge,
                           Model model){
       System.out.println("试卷ID" + examid + "学生id" + studentid);
       List<PaperChoice>paperChoices =  examService.AllPaperChoice(examid);
       List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
       ExamInformation examInformation = examService.findById(examid);
       List<AllAnswer>allAnswers =new ArrayList<AllAnswer>();
       ExamHistory examHistory = new ExamHistory();

//        Map<String, Object> map = new HashMap<String, Object>();
       int allscore = 0;
        for(int i = 0 ;i < paperChoices.size();i++){
            if(paperChoices.get(i).getAnswer().equals(answerchoice[i])){
                allscore += examInformation.getChoicescore();
            }

                AllAnswer  allAnswer= new AllAnswer();
                allAnswer.setStudentid(studentid);
                allAnswer.setExamid(examid);
                allAnswer.setStuanswer(answerchoice[i]);
                allAnswers.add(allAnswer);

        }
        for(int i = 0;i < paperJudges.size();i++){
            if (paperJudges.get(i).getAnswer().equals(answerjudge[i]) ) {
                allscore += examInformation.getJudgescore();
            }
                System.out.println(answerjudge[i]);
                AllAnswer  allAnswer= new AllAnswer();
                allAnswer.setStudentid(studentid);
                allAnswer.setExamid(examid);
                allAnswer.setStuanswer(answerjudge[i]);
                allAnswers.add(allAnswer);

        }
       for(int i= 0;i < allAnswers.size();i++){
           System.out.println("错误题目和答案  " + allAnswers.get(i).getStuanswer()+"  "+ allAnswers.get(i).getExamid());
       }
       //添加到错题本
         examService.CreateAllAnswer(allAnswers);
       examHistory.setExamid(examid);
       examHistory.setStudentid(studentid);
       examHistory.setScore(allscore);
       examService.CreateExamHistory(examHistory);
       System.out.println("当前考试总分为" + allscore);
        return "redirect:examallstu.do";
    }

    @RequestMapping("examhistory")
    public String ExamHistory(@RequestParam  int studentid,Model model){
        System.out.println("学生id" + studentid);
        List<ExamHistory>examHistories =examService.ByStudentid(studentid);
        List<Long>longList = new ArrayList<Long>();
        for(int i = 0;i < examHistories.size();i++){
            longList.add(examHistories.get(i).getExamid());
        }
        List<ExamInformation> examInformations = examService.AlreadExam(longList);
       for(int i  =0;i < examInformations.size();i++){
           examInformations.get(i).setAllscore((int) examHistories.get(i).getScore());
       }
       model.addAttribute("examend",examInformations);

    return "page/student/exam_end";
    }
    @RequestMapping("examdetial")
    public  String ExamHistory(@RequestParam int studentid,@RequestParam int examid, Model model){
        System.out.println("查询的学生和试卷id" + studentid+" "+ examid);
        List<AllAnswer>allAnswers = examService.AllAnswer(studentid,examid);
        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamHistory examHistory =examService.DetilsExam(studentid,examid);
        ExamInformation examInformation = examService.findById(examid);
         model.addAttribute("examinfo",examInformation);

        int allscore = (int) examHistory.getScore();
        model.addAttribute("allscore",allscore);
        for(int i = 0;i < paperChoices.size();i++){
            paperChoices.get(i).setMyanswer(allAnswers.get(i).getStuanswer());
        }
        for(int i = 0;i < paperJudges.size();i++){
            paperJudges.get(i).setMyanswer(allAnswers.get(i+paperChoices.size()).getStuanswer());
            System.out.println("判断题答案" + paperJudges.get(i).getMyanswer());
        }
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        return "page/student/exam_historypaper";
    }

}
