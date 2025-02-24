package com.aura.api.repositories;

import com.aura.api.dto.ProductPrice;
import com.aura.api.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("SELECT new com.aura.api.dto.ProductPrice(p.id, p.price) FROM Product p WHERE p.id IN :productIds")
    List<ProductPrice> findPricesByIds(@Param("productIds") List<Integer> productIds);
}
