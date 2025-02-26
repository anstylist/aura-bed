package com.aura.api.controllers;

import com.aura.api.models.Category;
import com.aura.api.models.Customer;
import com.aura.api.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class HealthController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public ResponseEntity<?> healthCheck() {
        try {
            List<Category> categories = categoryService.getAllCategories();
            HashMap<String, String> response = new HashMap<>();
            response.put("apiStatus", "ok");
            response.put("dbConnection", "ok");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            System.out.println("AURA API ERROR: " + e.getMessage());

            HashMap<String, String> response = new HashMap<>();
            response.put("apiStatus", "ok");
            response.put("dbConnection", "fail");
            return ResponseEntity.ok(response);
        }
    }
}
