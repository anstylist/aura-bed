package com.aura.api.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;


import java.time.Instant;

@Entity
@Table(name = "discount_code")
@Data
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class DiscountCode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "code", nullable = false, length = 40, unique = true)
    private String code;

    @Column(name = "limit_use")
    private Integer limitUse;

    @Column(name = "start_up_date")
    private Instant startUpDate;

    @Column(name = "expiration_date")
    private Instant expirationDate;

    @Column(name = "discount_percent")
    private Float discountPercent;
}

