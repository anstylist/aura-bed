package com.aura.api.controllers;

import com.aura.api.dto.CheckoutCustomer;
import com.aura.api.dto.CustomerOrder;
import com.aura.api.dto.auth.RegisteredUser;
import com.aura.api.exceptions.ExistentUserException;
import com.aura.api.models.Customer;
import com.aura.api.models.DiscountCode;
import com.aura.api.models.Order;
import com.aura.api.services.ICustomerService;
import com.aura.api.services.IOrderService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @Autowired
    private IOrderService orderService;

    @Autowired
    private ICustomerService customerService;

    @GetMapping
    public ResponseEntity<?> listCustomerOrder() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.notFound().build();
        }

        String userEmail = authentication.getName(); // Get user email
        Customer customer = customerService.getCustomerByEmail(userEmail);

        System.out.println("AURA - USER: " + customer);

        if (customer == null) {
            return ResponseEntity.notFound().build();
        }

        List<Order> orders = orderService.getOrdersByCustomerId(customer.getId());

        List<CustomerOrder> customerOrders = new ArrayList<>();
        for (Order order : orders) {
            Float discount = 0.0f;
            DiscountCode discountCode = order.getDiscountCode();
            if (discountCode != null) {
                discount = discountCode.getDiscountPercent();
            }

            CustomerOrder customerOrder = new CustomerOrder(
                    order.getId(),
                    order.getCustomer().getId(),
                    order.getPaymentMethod().getMethod(),
                    order.getStatus().getStatus(),
                    order.getSubTotal(),
                    order.getTotalPrice(),
                    order.getCreatedAt(),
                    order.getUpdatedAt(),
                    discount
            );

            customerOrders.add(customerOrder);
        }

        return ResponseEntity.status(HttpStatus.OK).body(customerOrders);
    }

    @PostMapping
    public ResponseEntity<?> checkoutOrder(@RequestBody CheckoutCustomer checkoutCustomer) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.notFound().build();
        }

        String userEmail = authentication.getName(); // Get user email
        Customer customer = customerService.getCustomerByEmail(userEmail);

        System.out.println("AURA - USER: " + customer);

        if (customer == null) {
            return ResponseEntity.notFound().build();
        }

        System.out.println("AURA - ORDER PAYLOAD: " + checkoutCustomer);
        Order order = orderService.createOrderWithProducts(customer.getId(), checkoutCustomer);

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }
}
