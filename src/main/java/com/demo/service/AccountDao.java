package com.demo.service;

import com.demo.model.Account;
import com.demo.repo.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AccountDao {

    @Autowired
    private AccountRepo accountRepo;

    public Account getOne(String username) {
        return accountRepo.findById(username)
                .orElseThrow(() -> new UsernameNotFoundException("username " + username + " not found."));
    }
}
