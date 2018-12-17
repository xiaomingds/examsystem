package cn.ds.mapper.exam;

import cn.ds.pojo.Exam.ExamInfo;
import cn.ds.pojo.Exam.Score;
import cn.ds.pojo.Tk.Blank;
import cn.ds.pojo.Tk.Choice;

import java.util.List;


public interface ExamMapper {
    void insert(ExamInfo examInfo);
    List<ExamInfo> FindAll();
    ExamInfo findById(Long id);
    List<Choice> RandId(Long exnumber);
    void CreateScore(Score score);
    void DeleteExam();
    void UpExaminfo(ExamInfo examInfo);

}
