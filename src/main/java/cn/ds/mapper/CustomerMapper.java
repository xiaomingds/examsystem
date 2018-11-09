package cn.ds.mapper;

import cn.ds.pojo.Customer;
import com.github.pagehelper.Page;

/**
 * @author ds
 */
public interface CustomerMapper {

    void create(Customer customer);

    void delete(Long id);

    Customer findById(Long id);

    void update(Customer customer);

    Page<Customer> findByPage(Customer customer);

//    int selectCount();

//    List<Customer> findCondition(Map<String,Object> conMap);
}
