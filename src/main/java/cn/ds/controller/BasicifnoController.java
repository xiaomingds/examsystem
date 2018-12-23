package cn.ds.controller;

import cn.ds.pojo.BasicInfo.Blass;
import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;
import cn.ds.pojo.Student;
import cn.ds.service.BasicInfoService;
import cn.ds.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/basic")
public class BasicifnoController {
    @Autowired
    private BasicInfoService basicInfoService;
    @Autowired
    private StudentService studentService;

    @ResponseBody
    @RequestMapping("/findall")
    public List<Semester> findAll(){//所有学期
        List<Semester>semesters=basicInfoService.findAll();
        return  semesters;
    }

    @RequestMapping("/allsemester")
    public String AllSemester(Model model){
        List<Semester>semesters = basicInfoService.findAll();
        model.addAttribute("semester",semesters);
        return "page/admin/base_year";
    }

    @RequestMapping("/insertse")
    public String CreatSe(Semester semester){//添加学期
        basicInfoService.CreateSemester(semester);
        return "redirect:allsemester.do";
    }
    @RequestMapping("/deletesemester")
    public String deletesemester(int[] chk_value){
        for(int i = 0;i < chk_value.length;i++){
            System.out.println(chk_value[i]);
        }
         System.out.println(chk_value.length);
         if (chk_value == null){
             return "redirect:allsemester.do";
         }
         else{
             basicInfoService.deleteSemester(chk_value);
             return "redirect:allsemester.do";
         }
    }//批量删除学期

    @ResponseBody
    @RequestMapping("/findmaall")
    public List<Major> findMaall(@RequestParam Long seid){//查找专业
        List<Major>majors= basicInfoService.findMaAll(seid);
        System.out.println("专业数量" +seid);
        return majors;
    }
    @RequestMapping("/allmajor")
    public  String AllMajor(@RequestParam long seid, Model model){
        System.out.println("seid" + seid);
        List<Major>majors = basicInfoService.findMaAll(seid);
        System.out.println(majors.size());
        model.addAttribute("major",majors);
        model.addAttribute("seid",seid);
        return "page/admin/base_major";
    }
    @RequestMapping("/insertma")
    public  String InsertMa(Major major, Model model){
           basicInfoService.CreateMajor(major);
           model.addAttribute("seid",major.getSeid());
          return "redirect:allmajor.do";
    }

    @ResponseBody
    @RequestMapping("/findciall")
    public List<Blass> findCiall(@RequestParam Long maid){//查找班级
        List<Blass>classes = basicInfoService.findCiAll(maid);
        System.out.println("班级数量" + classes.size());
        return classes;
    }


    @RequestMapping("/allclass")
    public String AllClass(@RequestParam long maid, Model model){
        System.out.println(maid);
        List<Blass>classes = basicInfoService.findCiAll(maid);
        model.addAttribute("cla",classes);
        model.addAttribute("maid",maid);
        return  "page/admin/base_class";
    }
    @RequestMapping("/insertclass")
    public String Isertcl(Blass blass,Model model){
        basicInfoService.CreateBlass(blass);
        model.addAttribute("maid",blass.getMaid());
        return  "redirect:allclass.do";
    }

    @RequestMapping("/allstudent")
    public  String FindStudent(@RequestParam String cname,Model model){
        System.out.println("班级名称"+ cname);
        List<Student>students = basicInfoService.findClass(cname);
        model.addAttribute("student",students);
        model.addAttribute("cname",cname);
        return "page/admin/base_student";
    }
    @RequestMapping("/studentall")
    @ResponseBody
    public List<Student> FindStudentAll(@RequestParam String cname){
        System.out.println("班级名称"+ cname);
        List<Student>students = basicInfoService.findClass(cname);
        System.out.println("学生数量" + students.size());
        return students;
    }
    @RequestMapping("/creatstu")
    public String CreatStu(Student student){
        student.setPassword(student.getNum());
        studentService.CreatStu(student);
        return "redirect:allstudent.do?cname="+student.getClassname();
    }



    @RequestMapping("/deleteclass")
    public void DeleteClass(@RequestParam String cname){
             System.out.println("删除的班级" + cname);
             basicInfoService.DeleteClass(cname);

    }
    @RequestMapping("/deletemajor")
    public void DeleteMajor(@RequestParam Long maid){
        System.out.println("删除的专业" + maid);
        basicInfoService.DeleteMajor(maid);

    }
    @RequestMapping("/deleteyear")
    public void DeleteYear(@RequestParam Long seid){
        System.out.println("删除的学年" + seid);
        basicInfoService.DeleteYear(seid);

    }
}

