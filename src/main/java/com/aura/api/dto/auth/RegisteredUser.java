package com.aura.api.dto.auth;

import com.aura.api.models.Customer;
import com.aura.api.utils.Role;
import lombok.Data;
import org.hibernate.usertype.CompositeUserType;

import java.time.Instant;

@Data
public class RegisteredUser {
    private String email;
    private String firstName;
    private String lastName;
    private Role role;
    private Instant createdAt;
    private Instant updatedAt;

    public RegisteredUser(Customer customer) {
        this.email = customer.getEmail();
        this.firstName = customer.getFirstName();
        this.lastName = customer.getLastName();
        this.role = customer.getRole();
        this.createdAt = customer.getCreatedAt();
        this.updatedAt = customer.getUpdatedAt();
    }
}
