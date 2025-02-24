package com.aura.api.models;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "influencer")
@Data
public class Influencer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "discount_code_id", nullable = false)
    private DiscountCode discountCode;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "email", length = 255, unique = true)
    private String email;

    @Column(name = "instagram", nullable = false, length = 45)
    private String instagram;

    @Column(name = "facebook", length = 45)
    private String facebook;

    @Column(name = "tiktok", length = 45)
    private String tiktok;

    @Column(name = "youtube", length = 45)
    private String youtube;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private Instant updatedAt;

    @OneToMany(mappedBy = "influencer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Campaing> campaings;
}

