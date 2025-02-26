package com.aura.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class CheckoutCustomer {
    String identifier;
    String address1;
    String address2;
    String city;
    String country;
    Integer zipCode;
    String orderNotes;
    Integer paymentMethodId;
    Integer discountId;
    List<OrderItem> products;
}
