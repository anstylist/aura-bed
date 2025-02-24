package com.aura.api.services;

import com.aura.api.dto.OrderItemRequest;
import com.aura.api.dto.ProductPrice;
import com.aura.api.exceptions.ResourceNotFoundException;
import com.aura.api.models.*;
import com.aura.api.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderService implements IOrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public Optional<Order> getOrderById(Integer id) {
        return orderRepository.findById(id);
    }

    @Override
    public Order createOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Order updateOrder(Integer id, Order orderDetails) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not found with id: " + id));

        order.setCustomer(orderDetails.getCustomer());
        order.setDiscountCode(orderDetails.getDiscountCode());
        order.setStatus(orderDetails.getStatus());
        order.setTotalPrice(orderDetails.getTotalPrice());
        order.setPaymentMethod(orderDetails.getPaymentMethod());
        order.setPaymentDate(orderDetails.getPaymentDate());

        return orderRepository.save(order);
    }

    public void deleteOrder(Integer id) {
        orderRepository.deleteById(id);
    }

    @Override
    @Transactional
    public Order createOrderWithProducts(
            Integer customerId,
            Integer paymentMethodId,
            List<OrderItemRequest> orderItems
    ) {
        Customer customer = new Customer();
        customer.setId(customerId);

        PaymentMethod paymentMethod = new PaymentMethod();
        paymentMethod.setId(paymentMethodId);

        OrderStatus defaultStatus = new OrderStatus();
        defaultStatus.setId(1);

        Order order = new Order();
        order.setCustomer(customer);
        order.setPaymentMethod(paymentMethod);
        order.setStatus(defaultStatus);
        order.setTotalPrice(0.0f);

        order = orderRepository.save(order);

        List<Integer> productIds = orderItems.stream()
                .map(OrderItemRequest::getProductId)
                .collect(Collectors.toList());

        Map<Integer, Double> productPrices = productRepository.findPricesByIds(productIds).stream()
                .collect(Collectors.toMap(ProductPrice::getId, ProductPrice::getPrice));
//        List<Product> productos = productRepository.findAllById(productIds);

        float totalPrice = 0.0f;
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (OrderItemRequest item : orderItems) {
            Integer productId = item.getProductId();
            Double price = productPrices.get(productId);

            if (price == null) {
                throw new ResourceNotFoundException("Product not found with id: " + productId);
            }

            Product product = new Product();
            product.setId(productId);

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(product);
            orderDetail.setQty(item.getQuantity());
            orderDetail.setUnityPrice(price.floatValue());
            orderDetails.add(orderDetail);

            totalPrice += price * item.getQuantity();
        }

        orderDetailRepository.saveAll(orderDetails);
        order.setTotalPrice(totalPrice);
        return orderRepository.save(order);
    }
}

