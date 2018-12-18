package cn.ds.service.impl;

import cn.ds.mapper.exam.ExamMapper;
import cn.ds.pojo.Exam.ExamInfo;
import cn.ds.pojo.Exam.Score;
import cn.ds.pojo.Tk.Choice;
import cn.ds.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
     private ExamMapper examMapper;

    @Override
    public void insert(ExamInfo examInfo) {
        examMapper.insert(examInfo);
    }

    @Override
    public List<ExamInfo> FindAll() {
        return examMapper.FindAll();
    }

    @Override
    public ExamInfo findById(Long id) {
        return examMapper.findById(id);
    }

    @Override
    public List<Choice> RandId(Long exnumber) {
        return examMapper.RandId(exnumber);
    }

    @Override
    public void CreateScore(Score score) {
        examMapper.CreateScore(score);
    }

    @Override
    public void UpExaminfo(ExamInfo examInfo) {
        examMapper.UpExaminfo(examInfo);
    }

    @Override
    public void DeleteExam(Long id) {
        examMapper.DeleteExam(id);
    }


}
