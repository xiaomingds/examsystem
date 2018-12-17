package cn.ds.pojo.Exam;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class ExamInfo {
    private long id;
    private String examname;
  private Date begindate;
    private Time begintime;
    private Date enddate;
    private Time endtime;
    private String password;
  private int state;
  private String teacher;
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
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Time getBegintime() {
        return begintime;
    }

    public void setBegintime(Time begintime) {
        this.begintime = begintime;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Time getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }
}
