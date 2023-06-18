package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;



@Entity
@Table(name="Categories")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category implements Serializable {
    @Id
    String id;
    String name;



}
