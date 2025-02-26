package com.aura.api.repositories;

import com.aura.api.dto.ProductPrice;
import com.aura.api.models.Product;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("SELECT new com.aura.api.dto.ProductPrice(p.id, p.price, p.stock) FROM Product p WHERE p.id IN :productIds")
    List<ProductPrice> findPricesByIds(@Param("productIds") List<Integer> productIds);

    @Modifying
    @Transactional
    @Query("UPDATE com.aura.api.models.Product p SET p.stock = :stock WHERE p.id = :id")
    void updateStockById(@Param("id") Integer id, @Param("stock") int stock);

    @Modifying
    @Transactional
    @Query("UPDATE com.aura.api.models.Product p SET p.stock = :#{#product.stock} WHERE p.id = :#{#product.id}")
    void batchStockUpdate(List<Product> products);
}
