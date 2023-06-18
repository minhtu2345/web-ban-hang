package com.demo.controller;

import com.demo.model.*;
import com.demo.repo.AccountRepo;
import com.demo.repo.CategoryRepo;
import com.demo.repo.OrderDetailRepo;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.ArrayList;
import java.util.List;


@Controller
public class AdminController {
    @Autowired
    ProductRepo repo;

    @Autowired
    CategoryRepo repo1;

    @Autowired
    AccountRepo repo2;

    @Autowired
    OrderDetailRepo repo3;
    //  Category
    @GetMapping("/admin/category/index")
    public String listCategory(Model model){
        Category item = new Category();
        model.addAttribute("item", item);
        List<Category> items = repo1.findAll();
        model.addAttribute("items", items);
        return "admin/category/index";
    }

    @PostMapping("/admin/category/create")
    public String createCategory(Category category){
        repo1.save(category);
        return "redirect:/admin/category/index";
    }

    @RequestMapping ("/admin/category/edit/{id}")
    public String editCategory(@PathVariable("id") String id, Model model){
        Category item = repo1.findById(id).get();
        model.addAttribute("item", item);
        List<Category> items = repo1.findAll();
        model.addAttribute("items", items);
        return "admin/category/index";
    }

    @RequestMapping("/admin/category/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        repo1.deleteById(id);
        return "redirect:/admin/category/index";
    }


    @RequestMapping("/Category/update")
    public String update(Category item) {
        repo1.save(item);
        return"redirect:/admin/category/edit/" + item.getId();
    }

    //  Product
    @GetMapping("/admin/product/index")
    public String listProduct(Model model){
        Product item = new Product();
        model.addAttribute("item", item);
        model.addAttribute("listCategory",repo1.findAll());
        List<Product> items = repo.findAll();
        model.addAttribute("items", items);
        return "admin/product/index";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Product item){
        repo.save(item);
        return "redirect:/admin/product/index";
    }

    @RequestMapping("/admin/product/edit/{id}")
    public String editProduct(@PathVariable("id") Integer id, Model model){
        Product item = repo.findById(id).get();
        model.addAttribute("item", item);
        List<Product> items = repo.findAll();
        model.addAttribute("items", items);
        model.addAttribute("listCategory1", repo1.findAll());
        return "admin/product/index";
    }

    @RequestMapping("/product/update")
    public String update(Product item) {
        repo.save(item);
        return "redirect:/admin/product/edit/" + item.getId();
    }

    @RequestMapping("/admin/product/delete/{id}")
    public String delete(@PathVariable("id") Integer id){
            repo.deleteById(id);
            return"redirect:/admin/product/index";
    }



    //  Account
    @GetMapping("/admin/account/index")
    public String listAccount(Model model){
        Account item = new Account();
        model.addAttribute("item",item);
        List<Account> items = repo2.findAll();
        model.addAttribute("items",items);
        return "admin/account/index";
    }

    @PostMapping("/admin/account/create")
    public String createAccount(Model model, Account account){
        repo2.save(account);
        return "redirect:/admin/account/index";
    }

    @GetMapping("/admin/account/edit/{id}")
    public String editAccount(@PathVariable int id){
        return "admin/account/form";
    }

    @RequestMapping("/admin/account/delete/{username}")
    public String deleteac(@PathVariable("username") String username) {
        repo2.deleteById(username);
        return "redirect:/admin/account/index";
    }

//    Orderdetail
    @RequestMapping("/admin/orderdetail/index")
    public String index(Model model) {
        OrderDetail item = new OrderDetail();
        model.addAttribute("item",item);
        List<OrderDetail> items = repo3.findAll();
        model.addAttribute("items", items);
        return "admin/Orderdetail/order";
    }

    @RequestMapping("/admin/orderdetail/delete/{id}")
    public String deletete(@PathVariable("id") Long id) {
        repo3.deleteById(id);
        return "redirect:/admin/orderdetail/index";
    }


}
