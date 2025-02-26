package com.aura.api.services;

import com.aura.api.dto.CheckoutCustomer;
import com.aura.api.dto.OrderItem;
import com.aura.api.models.Order;

import java.util.List;
import java.util.Optional;

public interface IOrderService {

    List<Order> getAllOrders();

    Optional<Order> getOrderById(Integer id);

    Order createOrder(Order order);

    Order updateOrder(Integer id, Order orderDetails);

    void deleteOrder(Integer id);

    Order createOrderWithProducts(Integer customerId,
                                  CheckoutCustomer customerAddress);

    List<Order> getOrdersByCustomerId(Integer customerId);
}
