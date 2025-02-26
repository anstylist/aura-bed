package com.aura.api.controllers;

import com.aura.api.models.Campaign;
import com.aura.api.models.Campaign;
import com.aura.api.models.Influencer;
import com.aura.api.services.CampaignService;
import com.aura.api.services.ICampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/campaigns")
public class CampaignController {

    @Autowired
    private ICampaignService campaignService;

    @GetMapping
    public List<Campaign> getAllCampaigns() {
        return campaignService.getAllCampaigns();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Campaign> getCampaignById(@PathVariable Integer id) {
        Optional<Campaign> campaign = campaignService.getCampaignById(id);
        return campaign.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Campaign> createCampaign(@RequestBody Campaign campaign) {
        Campaign createdCampaign = campaignService.createCampaign(campaign);
        return new ResponseEntity<>(createdCampaign, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Campaign> updateCampaign(@PathVariable Integer id, @RequestBody Campaign campaignDetails) {
        try {
            Campaign updatedCampaign = campaignService.updateCampaign(id, campaignDetails);
            return ResponseEntity.ok(updatedCampaign);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCampaign(@PathVariable Integer id) {
        campaignService.deleteCampaign(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}/influencer")
    public ResponseEntity<Influencer> getCampaignCampaigns(@PathVariable Integer id) {
        try {
            Influencer influencer = campaignService.getInfluencerByCampaignId(id);
            return ResponseEntity.ok(influencer);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}

