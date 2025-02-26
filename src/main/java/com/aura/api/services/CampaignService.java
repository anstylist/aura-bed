package com.aura.api.services;

import com.aura.api.exceptions.ResourceNotFoundException;
import com.aura.api.models.Campaign;
import com.aura.api.models.Influencer;
import com.aura.api.repositories.CampaignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CampaignService implements ICampaignService {

    @Autowired
    private CampaignRepository campaignRepository;

    @Override
    public List<Campaign> getAllCampaigns() {
        return campaignRepository.findAll();
    }

    @Override
    public Optional<Campaign> getCampaignById(Integer id) {
        return campaignRepository.findById(id);
    }

    @Override
    public Campaign createCampaign(Campaign campaign) {
        return campaignRepository.save(campaign);
    }

    @Override
    public Campaign updateCampaign(Integer id, Campaign campaignDetails) {
        Campaign campaign = campaignRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Campaign not found with id: " + id));

        campaign.setImageUrl(campaignDetails.getImageUrl());
        campaign.setVideoUrl(campaignDetails.getVideoUrl());
        campaign.setImageHoverUrl(campaignDetails.getImageHoverUrl());

        return campaignRepository.save(campaign);
    }

    @Override
    public void deleteCampaign(Integer id) {
        campaignRepository.deleteById(id);
    }

    public Influencer getInfluencerByCampaignId (Integer campaignId) {
        Campaign campaign = campaignRepository.findById(campaignId)
                .orElseThrow(() -> new ResourceNotFoundException("Campaign not found with id: " + campaignId));
        return campaign.getInfluencer();
    }

}
