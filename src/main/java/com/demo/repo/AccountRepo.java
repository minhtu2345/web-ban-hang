package com.demo.repo;


import com.demo.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface AccountRepo extends JpaRepository<Account, String> {

    Account findByUsername(String username);

    Optional<Account> findByUsernameAndPassword(String un, String pwd);

}
