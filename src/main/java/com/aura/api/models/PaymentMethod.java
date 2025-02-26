package com.aura.api.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "payment_method")
@Data
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class PaymentMethod {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "method", nullable = false, length = 45)
    private String method;
}
