package cn.ds.controller;

import cn.ds.pojo.Tk.Blank;
import cn.ds.service.BlankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/tk")
public class TkController {
    @Autowired
    BlankService blankService;

    @RequestMapping("/blankall")
    public String blanksAll(Model model){
        List<Blank>blanks  = blankService.findBlankAll();
        model.addAttribute("blanks",blanks);
        return "page/admin/blank";
    }

    @RequestMapping("/byId")
    public String findById(@RequestParam long id, Model model){
        Blank blank = blankService.findById(id);
        model.addAttribute("blank",blank);
        System.out.println("查找成功");
        return "page/admin/editblank";
    }
    @RequestMapping(value = "/deleteblank")
    public String delete(@RequestParam Long id) {
        try {
            blankService.DeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:blankall.do";
    }
}
