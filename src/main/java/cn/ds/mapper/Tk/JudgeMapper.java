package cn.ds.mapper.Tk;

import cn.ds.pojo.Tk.Judge;

import java.util.List;

public interface JudgeMapper {

    List<Judge>AllJudge();

    Judge findJudgeId(Long id);
    void  DeleteJudge(Long id);
    void  CreateJudge(Judge judge);
    void UpdateJudge(Judge judge);
    void deleteManyJudge(String chk_value);
}
