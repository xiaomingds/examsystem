package cn.ds.controller;

import cn.ds.pojo.Tk.*;
import cn.ds.service.TkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
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
        System.out.println("这是找到的数据"+programFills.getDifficulty());
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
        System.out.println("后台的请求数据"+programFill.getDifficulty());
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


    @RequestMapping("/allReadProgram")
    public String AllReadProgram(Model model){
        List<ReadProgram> readProgram = tkService.ReadProgramAll();
        model.addAttribute("readProgram",readProgram);
        return "page/admin/tk_readprogram";
    }
    @ResponseBody
    @RequestMapping("bypgId")
    public ReadProgram findBuId(@RequestBody ReadProgram readProgram){
        ReadProgram readPrograms = tkService.ByReadProgramId(readProgram.getId());
        System.out.println("这是找到的数据"+readPrograms.getDifficulty());
        if(readPrograms != null){
            return readPrograms;
        }else {
            return null;
        }
    }
    @RequestMapping("deletepg")
    public String DeleteDg(@RequestParam Long id){
        System.out.println("删除的id为"+id);
        tkService.DeleteReadProgram(id);
        return "redirect:allReadProgram.do";
    }
    @RequestMapping("/createpg")
    public String CreatePg(ReadProgram readProgram){
        System.out.println("内容"+ readProgram.getContent());
        tkService.CreateReadProgram(readProgram);
        return "redirect:allReadProgram.do";
    }
    @RequestMapping("/updg")
    public String UpDg(ReadProgram readProgram){
        System.out.println("后台的请求数据"+readProgram.getAnalysis());
        System.out.println("后台的数据请求"+readProgram.getDifficulty());
        tkService.updateReadProgram(readProgram);
        return "redirect:allReadProgram.do";
    }

    @RequestMapping("/allPgDesign")
    public String AllpgDesign(Model model){
        List<ProgramDesign> readPrograml = tkService.ProgramDesignAll();
        model.addAttribute("readPrograml",readPrograml);
        return "page/admin/tk_program_design";
    }
    @ResponseBody
    @RequestMapping("/bypdId")
    public ProgramDesign findBdId(@RequestBody ProgramDesign programDesign){
        ProgramDesign programDesigns =tkService.ByProgramDesignId(programDesign.getId());
        System.out.println("这是找到的数据"+programDesigns.getDifficulty());
        if(programDesigns!=null){
            return programDesigns;
        }else {
            return null;
        }
    }
    @RequestMapping("/createpd")
    public String CreatePd(ProgramDesign programDesign){
        System.out.println("内容"+programDesign.getContent());
        tkService.CreateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping("/deletepd")
    public String DeleteDd(@RequestParam Long id){
        System.out.println("删除的id为"+id);
        tkService.DeleteProgramDesign(id);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping("/updd")
    public String UpDd(ProgramDesign programDesign){
        System.out.println("后台的请求数据"+programDesign.getAnalysis());
        System.out.println("后台请求的数据"+programDesign.getDifficulty());
        tkService.updateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }


    @RequestMapping("/alljudge")
    public String AllJudge(Model model,@RequestParam(defaultValue = "1") int pn){

        PageHelper.startPage(pn,6);//显示个数
        List<Judge>judges = tkService.AllJudge();
        PageInfo pageInfo = new PageInfo(judges,5);//显示前后页数
        model.addAttribute("pageInfo",pageInfo);
//        pageInfo.getNavigatepageNums();
        return "page/admin/tk_judge";
    }

    @RequestMapping("/createjudge")
    public String CreateJudge(Judge judge){
        System.out.println("内容"+judge.getContent());
        tkService.CreateJudge(judge);
        return "redirect:alljudge.do";
    }
    @RequestMapping("/deletejudge")
    public String DeleteJudge(@RequestParam Long id){
        System.out.println("删除的id为"+id);
        tkService.DeleteJudge(id);
        return "redirect:alljudge.do";
    }
    @RequestMapping("/upjudge")
    public String UpJudge(Judge judge){
        System.out.println("后台的请求数据"+judge.getAnalysis());
        System.out.println("后台请求的数据"+judge.getDifficulty());
        tkService.UpdateJudge(judge);
        return "redirect:alljudge.do";
    }

    @ResponseBody
    @RequestMapping("judgeId")
    public Judge findJudgeId(@RequestBody Judge judge){
        Judge judges = tkService.findJudgeId(judge.getId());
        System.out.println("这是找到的数据"+judges.getDifficulty());
        if(judges != null){
            return judges;
        }else {
            return null;
        }
    }
    @RequestMapping("/deletemanyjudge")
    public String ManyJudge(String chk_value){
        System.out.println("获取的id——arr"+ chk_value);
     tkService.deleteManyJudge(chk_value);
     return "redirect:alljudge.do";
    }

}
