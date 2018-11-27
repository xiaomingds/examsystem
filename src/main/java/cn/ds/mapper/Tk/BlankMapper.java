package cn.ds.mapper.Tk;

import cn.ds.pojo.Tk.Blank;

import java.util.List;

public interface BlankMapper {
    List<Blank> findBlankAll();

    Blank findById(Long id);

    void  DeleteById(Long id);
}
