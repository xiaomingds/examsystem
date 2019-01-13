package cn.ds.controller;

import cn.ds.pojo.BasicInfo.*;
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
//    基本信息更新操作
    @RequestMapping("upse")
    public String UpSe(Semester semester){
        System.out.println("更新的学年" + semester.getSeid());
        basicInfoService.UpSemester(semester);
        return "redirect:allsemester.do";
    }
    @RequestMapping("upma")
    public String UpMa(Major major,Model model){
        System.out.println("更新的学年" + major.getSeid());
        basicInfoService.UpMajor(major);
        model.addAttribute("seid",major.getSeid());
        return "redirect:allmajor.do";
    }
    @RequestMapping("upcl")
    public String UpMa(Blass blass,Model model){
        System.out.println("更新的班级" + blass.getMaid());
        basicInfoService.UpBlass(blass);
        model.addAttribute("maid",blass.getMaid());
        return "redirect:allclass.do";
    }




    @RequestMapping("alldepart")
    public  String AllDepart(Model model){
        List<Depart>departs = basicInfoService.AllDepart();
        model.addAttribute("depart",departs);
        return "page/admin/base_depart";
    }
    @ResponseBody
    @RequestMapping("depart")
    public List<Depart> Depart(){
        List<Depart>departs = basicInfoService.AllDepart();
        return departs;
    }
    @RequestMapping("adddepart")
    public String AddDepart(Depart depart){
         System.out.println("添加院系" + depart);
        basicInfoService.InsertDepart(depart);
        return "redirect:alldepart.do";
    }
    @RequestMapping("deletedepart")
    public String DeleteDepart(@RequestParam int id){
        System.out.println("删除院系" + id);
        basicInfoService.deleteDepart(id);
        return "redirect:alldepart.do";
    }
    @RequestMapping("updepart")
    public String UpDepart(Depart depart){
        System.out.println("删除院系" + depart.getId());
        basicInfoService.updateDepart(depart);
        return "redirect:alldepart.do";
    }


    @RequestMapping("allsit")
    public  String AllSit(Model model){
        List<Sit>sits = basicInfoService.AllSit();
        model.addAttribute("sit",sits);
        return "page/admin/base_sit";
    }
    @ResponseBody
    @RequestMapping("sit")
    public List<Sit> Sit(){
        List<Sit>sits = basicInfoService.AllSit();
        return sits;
    }
    @RequestMapping("addsit")
    public String AddSit(Sit sit){
        System.out.println("添加职称" + sit);
        basicInfoService.InsertSit(sit);
        return "redirect:allsit.do";
    }
    @RequestMapping("deletesit")
    public String DeleteSit(@RequestParam int id){
        System.out.println("删除" + id);
        basicInfoService.deleteSit(id);
        return "redirect:allsit.do";
    }
    @RequestMapping("upsit")
    public String UpSit(Sit sit){
        System.out.println("删除院系" + sit.getId());
        basicInfoService.updateSit(sit);
        return "redirect:allsit.do";
    }
}

