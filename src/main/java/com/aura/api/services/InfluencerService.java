package com.aura.api.services;

import com.aura.api.exceptions.ResourceNotFoundException;
import com.aura.api.models.Campaing;
import com.aura.api.models.Influencer;
import com.aura.api.repositories.InfluencerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InfluencerService implements IInfluencerService {

    @Autowired
    private InfluencerRepository influencerRepository;

    @Override
    public List<Influencer> getAllInfluencers() {
        return influencerRepository.findAll();
    }

    @Override
    public Optional<Influencer> getInfluencerById(Integer id) {
        return influencerRepository.findById(id);
    }

    @Override
    public Influencer createInfluencer(Influencer influencer) {
        return influencerRepository.save(influencer);
    }

    @Override
    public Influencer updateInfluencer(Integer id, Influencer influencerDetails) {
        Influencer influencer = influencerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not found with id: " + id));

        influencer.setDiscountCode(influencerDetails.getDiscountCode());
        influencer.setName(influencerDetails.getName());
        influencer.setEmail(influencerDetails.getEmail());
        influencer.setInstagram(influencerDetails.getInstagram());
        influencer.setFacebook(influencerDetails.getFacebook());
        influencer.setTiktok(influencerDetails.getTiktok());
        influencer.setYoutube(influencerDetails.getYoutube());
        influencer.setCreatedAt(influencerDetails.getCreatedAt());
        influencer.setUpdatedAt(influencerDetails.getUpdatedAt());

        return influencerRepository.save(influencer);
    }

    @Override
    public void deleteInfluencer(Integer id) {
        influencerRepository.deleteById(id);
    }

    public List<Campaing> getInfluencerCampaigns(Integer influencerId) {
        Influencer influencer = influencerRepository.findById(influencerId)
                .orElseThrow(() -> new ResourceNotFoundException("Influencer not found with id: " + influencerId));
        return influencer.getCampaings();
    }

}

