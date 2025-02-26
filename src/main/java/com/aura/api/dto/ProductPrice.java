package com.aura.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductPrice {
    private Integer id;
    private Double price;
    private Integer stock;
}
