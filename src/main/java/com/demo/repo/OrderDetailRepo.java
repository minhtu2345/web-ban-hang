package com.demo.repo;

import com.demo.model.OrderDetail;
import com.demo.model.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

// TODO
public interface OrderDetailRepo extends JpaRepository<OrderDetail,Long> {


//
//    @Query("SELECT NEW  Report((o.order), sum(o.price), count(o)) "
//            + " FROM OrderDetail o "
//            + " GROUP BY o.order"
//            + " ORDER BY sum(o.price) DESC")
//    List<Report> getInventoryByCategory();

}
