package com.demo.controller;

import com.demo.model.Report;
import com.demo.repo.OrderDetailRepo;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReportController {
    @Autowired
    OrderDetailRepo repo;

//    @RequestMapping("/admin/orderdetail/index")
//    public String inventory(Model model) {
//        List<Report> itemss = repo.getInventoryByCategory();
//        model.addAttribute("items", itemss);
//        return "admin/Orderdetail/order";
//    }

}
