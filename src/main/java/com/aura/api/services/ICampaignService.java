package com.aura.api.services;

import com.aura.api.models.Campaign;
import com.aura.api.models.Influencer;

import java.util.List;
import java.util.Optional;

public interface ICampaignService {
    List<Campaign> getAllCampaigns();

    Optional<Campaign> getCampaignById(Integer id);

    Campaign createCampaign(Campaign campaign);

    Campaign updateCampaign(Integer id, Campaign campaignDetails);

    Influencer getInfluencerByCampaignId (Integer campaignId);

    void deleteCampaign(Integer id);
}
