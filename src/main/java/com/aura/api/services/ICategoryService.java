package com.aura.api.services;

import com.aura.api.models.Category;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {
    List<Category> getAllCategories();

    Optional<Category> getCategoryById(Integer id);

    Category createCategory(Category category);

    Category updateCategory(Integer id, Category categoryDetails);

    void deleteCategory(Integer id);
}
