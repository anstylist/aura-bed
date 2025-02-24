package com.aura.api.repositories;

import com.aura.api.models.CustomerAddress;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerAddressRepository extends JpaRepository<CustomerAddress, Integer> {
}
