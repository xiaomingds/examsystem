package cn.ds.service;

import cn.ds.pojo.Tk.Blank;

import java.util.List;

public interface BlankService {
    List<Blank> findBlankAll();
    Blank findById(Long id);
    void  DeleteById(Long id);

}
