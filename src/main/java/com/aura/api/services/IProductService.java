package com.aura.api.services;

import com.aura.api.models.Product;
import java.util.List;
import java.util.Optional;

public interface IProductService {

    List<Product> getAllProducts();

    Optional<Product> getProductById(Integer id);

    Product createProduct(Product product);

    Product updateProduct(Integer id, Product productDetails);

    void deleteProduct(Integer id);
}

