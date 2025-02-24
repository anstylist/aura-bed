package com.aura.api.repositories;

import com.aura.api.models.DiscountCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiscountCodeRepository extends JpaRepository<DiscountCode, Integer> {
}
