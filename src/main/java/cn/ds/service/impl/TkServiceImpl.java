package cn.ds.service.impl;

import cn.ds.mapper.Tk.BlankMapper;
import cn.ds.mapper.Tk.ProgramFillMapper;
import cn.ds.pojo.Tk.Blank;
import cn.ds.pojo.Tk.ProgramFill;
import cn.ds.service.TkService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TkServiceImpl implements TkService {
    @Autowired
    ProgramFillMapper programFillMapper;
     @Autowired
     BlankMapper blankMapper;
    @Override
    public List<ProgramFill> ProgramFillAll() {
        List<ProgramFill>programFills = programFillMapper.ProgramFillAll();
        for(int i = 0;i < programFills.size();i++){
            String s = StringEscapeUtils.escapeHtml4(programFills.get(i).getContent());

            programFills.get(i).setContent(s);
            System.out.println(programFills.get(i).getContent());
        }
        return programFills;
    }

    @Override
    public ProgramFill ByProgramFillId(Long id) {
        return programFillMapper.ByProgramFillId(id);
    }

    @Override
    public void DeleteProgramFill(Long id) {
        programFillMapper.DeleteProgramFill(id);
    }

    @Override
    public void CreateProgramFill(ProgramFill programFill) {
        programFillMapper.CreateProgramFill(programFill);
    }

    @Override
    public void updateProgramFill(ProgramFill programFill) {
        programFillMapper.updateProgramFill(programFill);
    }

    @Override
    public List<Blank> findBlankAll() {
        List<Blank>blanks = blankMapper.findBlankAll();
        for(int i = 0;i < blanks.size();i++){
            String s = StringEscapeUtils.escapeHtml4(blanks.get(i).getContent());
            blanks.get(i).setContent(s);
            System.out.println(blanks.get(i).getContent());
        }
        return blanks;
    }

    @Override
    public Blank findBlankId(Long id) {
        return blankMapper.findBlankId(id);
    }

    @Override
    public void DeleteBlank(Long id) {
               blankMapper.DeleteBlank(id);
    }

    @Override
    public void CreateBlank(Blank blank) {
                blankMapper.CreateBlank(blank);
    }

    @Override
    public void UpdateBlank(Blank blank) {
                blankMapper.UpdateBlank(blank);
    }
}
