package cn.ds.service;

import cn.ds.pojo.Exam.ExamInfo;
import cn.ds.pojo.Exam.Score;
import cn.ds.pojo.Tk.Choice;

import java.util.List;

public interface ExamService {
    void insert(ExamInfo examInfo);
    List<ExamInfo> FindAll();
    ExamInfo findById(Long id);
    List<Choice> RandId(Long exnumber);
    void CreateScore(Score score);
    void UpExaminfo(ExamInfo examInfo);
    void DeleteExam(Long id);

}
