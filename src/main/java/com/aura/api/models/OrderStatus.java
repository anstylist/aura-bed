package com.aura.api.models;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "`order_status`")
@Data
public class OrderStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "status", nullable = false, length = 45)
    private String status;
}

