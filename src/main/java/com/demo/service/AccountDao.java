package com.demo.service;

import com.demo.model.Account;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AccountDao {

    public Account getOne(String username){
        List<Account> accounts = new ArrayList<>();
        return accounts.stream()
                .filter(a -> a.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }
}
