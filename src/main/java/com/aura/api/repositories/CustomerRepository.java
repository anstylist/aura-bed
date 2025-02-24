package com.aura.api.repositories;

import com.aura.api.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    public Customer findByEmail(String email);
}
