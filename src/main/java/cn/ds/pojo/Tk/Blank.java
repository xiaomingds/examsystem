package cn.ds.pojo.Tk;


public class Blank {
    private long id;
    private  String content;
    private  String answer;
    private String analysis;
    private String chapter;
    private String chaptertwo;
    private String difficulty;

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

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
