package com.aura.api.services;

import com.aura.api.dto.CheckoutCustomer;
import com.aura.api.dto.OrderItem;
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

    @Autowired
    private CustomerAddressRepository customerAddressRepository;

    @Autowired
    private DiscountCodeRepository discountCodeRepository;

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

    @Transactional
    public Order createOrderWithProducts(
            Integer customerId,
            CheckoutCustomer checkoutCustomer
    ) {
        System.out.println("AURA - STARTING ORDER CREATION");
        List<OrderItem> orderItems = checkoutCustomer.getProducts();
        Customer customer = new Customer();
        customer.setId(customerId);

        PaymentMethod paymentMethod = new PaymentMethod();
        paymentMethod.setId(checkoutCustomer.getPaymentMethodId());

        OrderStatus defaultStatus = new OrderStatus();
        defaultStatus.setId(2);

        Optional<DiscountCode> discountCode;

        CustomerAddress customerAddress = new CustomerAddress();
        customerAddress.setIdentifier(checkoutCustomer.getIdentifier());
        customerAddress.setAddress1(checkoutCustomer.getAddress1());
        customerAddress.setAddress2(checkoutCustomer.getAddress2());
        customerAddress.setCity(checkoutCustomer.getCity());
        customerAddress.setCountry(checkoutCustomer.getCountry());
        customerAddress.setZipCode(checkoutCustomer.getZipCode());
        customerAddress.setCustomer(customer);

        customerAddress = customerAddressRepository.save(customerAddress);

        System.out.println("AURA - CUSTOMER ADDRESS CREATED");

        Order order = new Order();
        order.setCustomer(customer);
        order.setPaymentMethod(paymentMethod);
        order.setStatus(defaultStatus);
        order.setTotalPrice(0.0f);
        order.setCustomerAddress(customerAddress);

        order = orderRepository.save(order);

        System.out.println("AURA - ORDER CREATED");

        List<Integer> productIds = orderItems.stream()
                .map(OrderItem::getProductId)
                .collect(Collectors.toList());

        Map<Integer, Double> productPrices = productRepository.findPricesByIds(productIds).stream()
                .collect(Collectors.toMap(ProductPrice::getId, ProductPrice::getPrice));

        Map<Integer, Integer> productStocks = productRepository.findPricesByIds(productIds).stream()
                .collect(Collectors.toMap(ProductPrice::getId, ProductPrice::getStock));

        float totalPrice = 0.0f;
        float subTotal = 0.0f;
        float discount = 0.0f;

        List<OrderDetail> orderDetails = new ArrayList<>();
        for (OrderItem item : orderItems) {
            Integer productId = item.getProductId();
            Double price = productPrices.get(productId);
            Integer stock = productStocks.get(productId);

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

            productRepository.updateStockById(product.getId(), stock - item.getQuantity());

            subTotal += price * item.getQuantity();
        }

        totalPrice = subTotal;
        if (checkoutCustomer.getDiscountId() != null) {
            discountCode = discountCodeRepository.findById(checkoutCustomer.getDiscountId());
            if (discountCode.isPresent()) {
                 discount = discountCode.get().getDiscountPercent()/100 * subTotal;
                 totalPrice -= discount;
            }
        }

        orderDetailRepository.saveAll(orderDetails);

        System.out.println("AURA - ORDER DETAILS CREATED");

        order.setSubTotal(subTotal);
        order.setTotalPrice(totalPrice);

        System.out.println("AURA - ORDER UPDATED WITH TOTAL PRICE");
        return orderRepository.save(order);
    }

    public List<Order> getOrdersByCustomerId(Integer customerId) {
        return orderRepository.findByCustomerId(customerId);
    }
}

