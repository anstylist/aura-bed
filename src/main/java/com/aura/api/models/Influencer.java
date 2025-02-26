package com.aura.api.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "influencer")
@Data
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Influencer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "discount_code_id", nullable = false)
    @JsonManagedReference
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
    @JsonBackReference
    private List<Campaign> campaigns;
}

