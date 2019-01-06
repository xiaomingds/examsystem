package cn.ds.pojo.Exam;

public class ExamHistory {
    private long id;
    private long examid;
    private  long studentid;
    private long score;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getExamid() {
        return examid;
    }

    public void setExamid(long examid) {
        this.examid = examid;
    }

    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    public long getScore() {
        return score;
    }

    public void setScore(long score) {
        this.score = score;
    }
}
