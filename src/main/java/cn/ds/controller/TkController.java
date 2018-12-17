package cn.ds.controller;

import cn.ds.pojo.Tk.Blank;
import cn.ds.pojo.Tk.ProgramFill;
import cn.ds.service.TkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/tk")
public class TkController {

    @Autowired
    TkService tkService;

    @RequestMapping("/allReadFill")
    public  String AllReadFill(Model model){
        List<ProgramFill> readPrograms = tkService.ProgramFillAll();
        model.addAttribute("readPrograms",readPrograms);
        return "page/admin/tk_program_fill";
    }
    @ResponseBody
    @RequestMapping("/bypfId")
    public ProgramFill findBychId(@RequestBody ProgramFill programFill) {
        ProgramFill programFills = tkService.ByProgramFillId(programFill.getId());
        System.out.println("这是找到的数据"+programFills.getDifficult());
        if (programFills != null) {
            return programFills;
        } else {
            return null;
        }
    }
    @RequestMapping("/createpf")
    public String CreatePf(ProgramFill programFill){
        System.out.println("内容"+ programFill.getContent());
        tkService.CreateProgramFill(programFill);
        return "redirect:allReadFill.do";
    }
    @RequestMapping("/deletepf")
    public String DeleteDf(@RequestParam Long id){
        System.out.println("删除的id为"+id);
        tkService.DeleteProgramFill(id);
        return "redirect:allReadFill.do";
    }
    @RequestMapping("/updf")
    public String UpDf(ProgramFill programFill){
        System.out.println("后台的请求数据"+programFill.getAnalysis());
        System.out.println("后台的请求数据"+programFill.getDifficult());
        tkService.updateProgramFill(programFill);
        return "redirect:allReadFill.do";
    }



    @RequestMapping("/blankall")
    public String blanksAll(Model model){
        List<Blank>blanks  = tkService.findBlankAll();
        model.addAttribute("blanks",blanks);
        return "page/admin/tk_blank";
    }
    @RequestMapping("/findblankId")
    @ResponseBody
    public Blank findById(@RequestBody Blank blank){
        Blank blanks =tkService.findBlankId(blank.getId());
        System.out.println("查找成功");
        return blanks;
    }
    @RequestMapping(value = "/deleteblank")
    public String delete(@RequestParam Long id) {
        try {
            tkService.DeleteBlank(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:blankall.do";
    }
    @RequestMapping("/createblank")
    public String CreateBlank(Blank blank){
        System.out.println("内容"+ blank.getContent());
        tkService.CreateBlank(blank);
        return "redirect:blankall.do";
    }
    @RequestMapping("/upblank")
    public String UpBlank(Blank blank){
        System.out.println("后台的请求数据"+blank.getAnalysis());
        System.out.println("后台的请求数据"+blank.getDifficulty());
        tkService.UpdateBlank(blank);
        return "redirect:blankall.do";
    }
}
