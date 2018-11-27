package cn.ds.service.impl;

import cn.ds.mapper.Tk.BlankMapper;
import cn.ds.pojo.Tk.Answer;
import cn.ds.pojo.Tk.Blank;
import cn.ds.service.BlankService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BlankServiceImpl implements BlankService {
    @Autowired
    BlankMapper blankMapper;
    @Override
    public List<Blank> findBlankAll() {
        List<Blank>blanks = blankMapper.findBlankAll();
        //转义字符的实现方法
        for(int i = 0;i < blanks.size();i++){
            String s = StringEscapeUtils.escapeHtml4(blanks.get(i).getContent());
           blanks.get(i).setContent(s);
            System.out.println(blanks.get(i).getContent());
        }
        return blanks;
    }

    @Override
    public Blank findById(Long id) {
        Blank blank = blankMapper.findById(id);
        String s = StringEscapeUtils.escapeHtml4(blank.getContent());
        blank.setContent(s);
        return blank;
    }

    @Override
    public void DeleteById(Long id) {
           blankMapper.DeleteById(id);
    }
}
