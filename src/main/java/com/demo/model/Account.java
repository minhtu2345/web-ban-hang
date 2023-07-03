package com.demo.model;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
@Entity
@Table(name="Accounts")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class Account implements Serializable {
    @Id
    @NotBlank(message = "Không được để trống username")
    String username;
    @NotBlank(message = "Không được để trống password")
    String password;
    @NotBlank(message = "Không được để trống fullname")
    String fullname;
    @NotBlank(message = "Không được để trống email")
    @Email(message = "Nhập đúng định dạng email")
    String email;

    Boolean activated;
    Boolean admin;

    public boolean isAdmin(){
        return admin != null && admin;
    }
}
