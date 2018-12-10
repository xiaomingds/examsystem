package cn.ds.pojo.Exam;

public class ExamInfo {
    private long id;
    private String examname;
    private  long exnumber;
    private long score;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname;
    }



    public long getScore() {
        return score;
    }

    public void setScore(long score) {
        this.score = score;
    }
    public long getExnumber() {
        return exnumber;
    }

    public void setExnumber(long exnumber) {
        this.exnumber = exnumber;
    }
}
