package com.aura.api.repositories;

import com.aura.api.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query("SELECT o FROM com.aura.api.models.Order o WHERE o.customer.id = :customerId")
    List<Order> findByCustomerId(@Param("customerId") Integer customerId);
}