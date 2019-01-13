package cn.ds.mapper.exam;

import cn.ds.pojo.Exam.*;
import cn.ds.pojo.Tk.Blank;
import cn.ds.pojo.Tk.Choice;
import cn.ds.pojo.Tk.Judge;
import com.sun.javafx.collections.MappingChange;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface ExamMapper {



    void CreateExam(ExamInformation examInformation);
    List<ExamInformation> AllExam();
    List<PaperChoice> RandChoice(@Param("choicenum")Long choicenum, @Param("chaptertwo")String chaptertwo);
    List<PaperJudge> RandJudge(@Param("judgenum")Long judgenum, @Param("chaptertwo")String chaptertwo);
   void insertRandChoice(List<PaperChoice>paperChoices);
    void insertRandJudge(List<PaperJudge>paperJudges);
    List<PaperChoice>AllPaperChoice(int examid);
    List<PaperJudge>AllPaperJudge(int examid);
    ExamInformation findById(int id);
    void CreateAllAnswer(List<AllAnswer>allAnswers);
    void CreateExamHistory(ExamHistory examHistory);
    List<ExamHistory> ByStudentid(int studentid);
    ExamHistory DetilsExam(@Param("studentid")int studentid,@Param("examid")int examid);
    List<ExamInformation> AlreadExam(List<Long>longList);
    List<AllAnswer>AllAnswer(@Param("studentid")int studentid,@Param("examid")int examid);
    void DeletePaperChoice(int examid);
    void DeletePaperJudge(int examid);
    void DeleteExamInfo(int examid);
    List<ExamHistory>ByExamId(int examid);
//     List<WrongAnswer> insertWrongAnswer(Map<String, Object> map);
}
