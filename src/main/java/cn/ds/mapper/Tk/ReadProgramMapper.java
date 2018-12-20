package cn.ds.mapper.Tk;

import cn.ds.pojo.Tk.ReadProgram;

import java.util.List;

public interface ReadProgramMapper {
    List<ReadProgram>ReadProgramAll();
    ReadProgram ByReadProgramId(Long id);
    void DeleteReadProgram(Long id);
    void CreateReadProgram(ReadProgram readProgram);
    void updateReadProgram(ReadProgram readProgram);

}
