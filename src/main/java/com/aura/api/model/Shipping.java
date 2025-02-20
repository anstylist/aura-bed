package com.aura.api.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;

@Entity
@Table(name = "shipping")
@Data
public class Shipping {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @Column(name = "shipping_company", nullable = false, length = 255)
    private String shippingCompany;

    @Column(name = "tracking_number", nullable = false, length = 255)
    private String trackingNumber;

    @Column(name = "shipping_date")
    private Instant shippingDate;

    @Column(name = "estimated_delivery_date")
    private Instant estimatedDeliveryDate;
}

