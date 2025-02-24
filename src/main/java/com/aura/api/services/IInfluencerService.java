package com.aura.api.services;



import com.aura.api.models.Influencer;

import java.util.List;
import java.util.Optional;

public interface IInfluencerService {

    List<Influencer> getAllInfluencers();

    Optional<Influencer> getInfluencerById(Integer id);

    Influencer createInfluencer(Influencer influencer);

    Influencer updateInfluencer(Integer id, Influencer influencerDetails);

    void deleteInfluencer(Integer id);
}

