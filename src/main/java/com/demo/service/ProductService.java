package com.demo.service;

import com.demo.model.Category;
import com.demo.model.Product;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

//TODO: Connect to database
@Service
public class ProductService {
    @Autowired
    ProductRepo repo;
    public List<Product> getAll(){
       return repo.findAll();
    }

    public Product findById(int id) {
        return getAll()
                .stream()
                .filter(x -> x.getId() == id)
                .findFirst()
                .orElse(null);
    }
}
