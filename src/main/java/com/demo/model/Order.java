package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@Table(name="Orders")
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String address;
    @Temporal(TemporalType.DATE)
    @Column(name="Createdate")
    Date createDate = new Date();

    @ManyToOne
    @JoinColumn(name="Username")
    Account account;
}
