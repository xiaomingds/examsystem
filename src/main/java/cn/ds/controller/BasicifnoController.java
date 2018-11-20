package cn.ds.controller;

import cn.ds.pojo.BasicInfo.Major;
import cn.ds.pojo.BasicInfo.Semester;
import cn.ds.service.BasicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/basic")
public class BasicifnoController {
    @Autowired
    private BasicInfoService basicInfoService;

    @ResponseBody
    @RequestMapping("/findall")
    public List<Semester> findAll(){
        List<Semester>semesters=basicInfoService.findAll();
        return  semesters;
    }
    @ResponseBody
    @RequestMapping("/findmaall")
    public List<Major> findMaall(@RequestParam Long seid){
        List<Major>majors= basicInfoService.findMaAll(seid);
        return majors;
    }
    @ResponseBody
    @RequestMapping("/findciall")
    public List<Class> findCiall(@RequestParam Long maid){
        List<Class>classes = basicInfoService.findCiAll(maid);
        return classes;
    }
}
