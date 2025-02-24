package com.aura.api.repositories;

import com.aura.api.models.Shipping;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShippingRepository extends JpaRepository<Shipping, Integer> {
}
