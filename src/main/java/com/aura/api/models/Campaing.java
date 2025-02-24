package com.aura.api.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "campaing")
@Data
public class Campaing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "influencer_id", nullable = false)
    private Influencer influencer;

    @Column(name = "image_url", nullable = false, length = 255)
    private String imageUrl;

    @Column(name = "image_hover_url", length = 255)
    private String imageHoverUrl;

    @Column(name = "video_url", nullable = false, length = 255)
    private String videoUrl;
}

