package com.aura.api.repositories;

import com.aura.api.models.Influencer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InfluencerRepository extends JpaRepository<Influencer, Integer> {
}
