package cn.ds.service;

import cn.ds.pojo.Tk.Blank;
import cn.ds.pojo.Tk.ProgramFill;

import java.util.List;

public interface TkService {
    List<ProgramFill>ProgramFillAll();
    ProgramFill ByProgramFillId(Long id);
    void  DeleteProgramFill(Long id);
    void CreateProgramFill(ProgramFill programFill);
    void updateProgramFill(ProgramFill programFill);

}
