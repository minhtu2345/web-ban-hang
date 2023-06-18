package com.demo.repo;

import com.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    @Query("SELECT o FROM Product o WHERE  o.name like ?1  and o.price between ?2 and ?3 and o.category.id=?4")
    Page<Product> findByKeywords(String keywords,int minPrice, int maxPrice,String sc,Pageable pageable);

    @Query("SELECT o FROM Product o WHERE  o.name like ?1  and o.price between ?2 and ?3")
    Page<Product> findByKeywords2(String keywords,int minPrice, int maxPrice,Pageable pageable);

}
