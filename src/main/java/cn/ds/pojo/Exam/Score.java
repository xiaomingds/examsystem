package cn.ds.pojo.Exam;

public class Score {
    private  long  id;
    private  String examname;
    private  long allscore;

    public long getAllscore() {
        return allscore;
    }
    public void setAllscore(long allscore) {
        this.allscore = allscore;
    }
    public String getExamname() {
        return examname;
    }
    public void setExamname(String examname) {
        this.examname = examname;
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
