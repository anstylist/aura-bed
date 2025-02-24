package com.aura.api.services;

import com.aura.api.dto.OrderItemRequest;
import com.aura.api.models.Order;

import java.util.List;
import java.util.Optional;

public interface IOrderService {

    List<Order> getAllOrders();

    Optional<Order> getOrderById(Integer id);

    Order createOrder(Order order);

    Order updateOrder(Integer id, Order orderDetails);

    void deleteOrder(Integer id);

    Order createOrderWithProducts(Integer customerId, Integer paymentMethodId, List<OrderItemRequest> orderItems);
}
