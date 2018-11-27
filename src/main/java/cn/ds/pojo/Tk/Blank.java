package cn.ds.pojo.Tk;

import java.util.List;

public class Blank {
    private long id;
    private  String content;
    private String analysis;
    private String chapter;
    private String chaptertwo;
    private String difficult;

    private List<Answer> answer;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Answer> getAnswer() {
        return answer;
    }

    public void setAnswer(List<Answer> answer) {
        this.answer = answer;
    }
    @Override
    public String toString() {
        return "Blank [id=" + id + ", name=" + content + "]";
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    public String getChaptertwo() {
        return chaptertwo;
    }

    public void setChaptertwo(String chaptertwo) {
        this.chaptertwo = chaptertwo;
    }

    public String getDifficult() {
        return difficult;
    }

    public void setDifficult(String difficult) {
        this.difficult = difficult;
    }
}
