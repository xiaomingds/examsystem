package cn.ds.controller;

import cn.ds.pojo.Exam.*;
import cn.ds.pojo.Student;
import cn.ds.pojo.Teacher;
import cn.ds.service.ExamService;
import cn.ds.service.StudentService;
import cn.ds.service.TeacherService;
import cn.ds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ExamService examService;
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    //2019.1.3添加
    @RequestMapping("/addexam")
    public  String addexam(Model model){
        List<Teacher> teachers = userService.findTeacherAll();
        model.addAttribute("teacher",teachers);
        return "page/teacher/addexam";
    }
    @RequestMapping("/adminaddexam")
    public  String AdminAddExam(Model model){
        List<Teacher> teachers = userService.findTeacherAll();
        model.addAttribute("teacher",teachers);
        return "page/admin/addexam";
    }

    @RequestMapping("/examadd") //添加考试
    public  String examadd(ExamInformation examInformation){
        examService.CreateExam(examInformation);
        List<PaperJudge>paperJudges = examService.RandJudge((long) examInformation.getJudgenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
        List<PaperChoice>paperChoices = examService.RandChoice((long) examInformation.getChoicenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
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
    @RequestMapping("/adminexamadd") //添加考试
    public  String Adminexamadd(ExamInformation examInformation){
        examService.CreateExam(examInformation);
        List<PaperJudge>paperJudges = examService.RandJudge((long) examInformation.getJudgenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
        List<PaperChoice>paperChoices = examService.RandChoice((long) examInformation.getChoicenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
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
        return "redirect:allexam.do";
    }
    @RequestMapping("/examall")
    public String ExamAll(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/teacher/exam_info";
    }
    @RequestMapping("detail")
    public String ExamDetail(@RequestParam int examid, Model model){
        System.out.println("考试id" +examid);
        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
       ExamInformation examInformations = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo",examInformations);
        return "page/teacher/exam_detail";
    }
    @RequestMapping("admindetail")
    public String AdminExamDetail(@RequestParam int examid, Model model){

        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamInformation examInformations = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo",examInformations);
        return "page/admin/exam_detail";
    }
    @RequestMapping("deleteexam")
    public String DeleteExam(@RequestParam int examid){
        examService.DeletePaperChoice(examid);
        examService.DeletePaperJudge(examid);
        examService.DeleteExamInfo(examid);
        return "redirect:examall.do";
    }
    @RequestMapping("admindeleteexam")
    public String AdminDeleteExam(@RequestParam int examid){
        System.out.println("删除的考试id"+ examid);
        examService.DeletePaperChoice(examid);
        examService.DeletePaperJudge(examid);
        examService.DeleteExamInfo(examid);
        return "redirect:allexam.do";
    }
    //管理员查询
    @RequestMapping("/allexam")
    public String AllExam(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/admin/exam_info";
    }
    //根据考试id查询所有参加过考试的学生
    @RequestMapping("/allexamstu")
    public String AllExamStu(@RequestParam int examid,Model model){

        Map<Long, Long> map = new HashMap<>();
      List<ExamHistory>examHistories = examService.ByExamId(examid);
        List<Long>longList = new ArrayList<Long>();
        List<Student>students = new ArrayList<Student>();
        for(int i = 0;i < examHistories.size();i++){
           map.put(examHistories.get(i).getStudentid(),examHistories.get(i).getScore());
            longList.add(examHistories.get(i).getStudentid());
        }
        if(longList.isEmpty()){
          students.add(null);
        }
        else {
            students = studentService.AllStudent(longList);
            for (int i = 0; i < examHistories.size(); i++) {
                students.get(i).setId(map.get(students.get(i).getId()));
            }
            Collections.sort(students, new Comparator<Student>() {//按score排序
                public int compare(Student p1, Student p2) {
                    if (p1.getId() < p2.getId()) {
                        return 1;
                    }
                    if (p1.getId() == p2.getId()) {
                        return 0;
                    }
                    return -1;
                }
            });
        }
        model.addAttribute("student",students);
        return "page/admin/exam_allstudent";
    }
    //老师页根据考试id查询所有参加过考试的学生
    @RequestMapping("/allstuexam")
    public String AllStuExam(@RequestParam int examid,Model model){
        Map<Long, Long> map = new HashMap<>();
        List<ExamHistory>examHistories = examService.ByExamId(examid);
        List<Long>longList = new ArrayList<Long>();
        List<Student>students = new ArrayList<Student>();
        for(int i = 0;i < examHistories.size();i++){
            map.put(examHistories.get(i).getStudentid(),examHistories.get(i).getScore());
            longList.add(examHistories.get(i).getStudentid());
        }
        if(longList.isEmpty()){
            students.add(null);
        }
        else {
            students = studentService.AllStudent(longList);
            for (int i = 0; i < examHistories.size(); i++) {
                students.get(i).setId(map.get(students.get(i).getId()));
            }
            Collections.sort(students, new Comparator<Student>() {//按score排序
                public int compare(Student p1, Student p2) {
                    if (p1.getId() < p2.getId()) {
                        return 1;
                    }
                    if (p1.getId() == p2.getId()) {
                        return 0;
                    }
                    return -1;
                }
            });
        }
        model.addAttribute("student",students);
        return "page/teacher/exam_allstudent";
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
        return "redirect:examallstu.do?studentid="+studentid;
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

    @ResponseBody
   @RequestMapping("stuscore")
    public List<ExamInformation> StuScore(@RequestParam String name){
        System.out.println("查询的name" + name);
        List<FindStudentScore>studentScores = new ArrayList<FindStudentScore>();
        List<ExamInformation> examInformations = new ArrayList<ExamInformation>();
        Student student = new Student();
        List<Long>longList = new ArrayList<Long>();
        if(name.length() <5){
             student = studentService.login(name);
        }
        else{
           student = studentService.ByNum(name);
        }
        long id = student.getId();
        List<ExamHistory>examHistories = examService.ByStudentid((int) id);
        System.out.println("");
        System.out.println("总共有 @@@@@" + examHistories.size() + "考试");
        if(examHistories.size() ==0){
            System.out.println("到这儿了" + examInformations.size());
            return examInformations;
        }
        else {
            for (int i = 0; i < examHistories.size(); i++) {
                longList.add(examHistories.get(i).getExamid());
            }
            examInformations = examService.AlreadExam(longList);
            System.out.println("有" + examInformations.size() + "考试信息");
            for (int i = 0; i < examInformations.size(); i++) {
                examInformations.get(i).setAllscore((int) examHistories.get(i).getScore());
                examInformations.get(i).setStudentname(student.getUsername());
            }
            System.out.println("总共有 " + examInformations.size() + "考试");
            return examInformations;
        }
   }
}
