package com.aura.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.Instant;

@Data
@AllArgsConstructor
public class CustomerOrder {
    private Integer id;
    private Integer customerId;
    private String paymentMethod;
    private String status;
    private Float subTotal;
    private Float totalPrice;
    private Instant createdAt;
    private Instant updatedAt;
    private Float discount;
}
