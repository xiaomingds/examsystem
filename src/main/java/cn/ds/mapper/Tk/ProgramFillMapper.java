package cn.ds.mapper.Tk;

import cn.ds.pojo.Tk.ProgramFill;
import java.util.List;

public interface ProgramFillMapper {
    List<ProgramFill>ProgramFillAll();
    ProgramFill ByProgramFillId(Long id);
    void  DeleteProgramFill(Long id);
    void CreateProgramFill(ProgramFill programFill);
    void updateProgramFill(ProgramFill programFill);
}
