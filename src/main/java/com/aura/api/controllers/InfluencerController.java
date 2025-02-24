package com.aura.api.controllers;

import com.aura.api.models.Campaing;
import com.aura.api.models.Influencer;
import com.aura.api.services.InfluencerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/influencers")
public class InfluencerController {

    @Autowired
    private InfluencerService influencerService;

    @GetMapping
    public List<Influencer> getAllInfluencers() {
        return influencerService.getAllInfluencers();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Influencer> getInfluencerById(@PathVariable Integer id) {
        Optional<Influencer> influencer = influencerService.getInfluencerById(id);
        return influencer.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Influencer> createInfluencer(@RequestBody Influencer influencer) {
        Influencer createdInfluencer = influencerService.createInfluencer(influencer);
        return new ResponseEntity<>(createdInfluencer, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Influencer> updateInfluencer(@PathVariable Integer id, @RequestBody Influencer influencerDetails) {
        try {
            Influencer updatedInfluencer = influencerService.updateInfluencer(id, influencerDetails);
            return ResponseEntity.ok(updatedInfluencer);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteInfluencer(@PathVariable Integer id) {
        influencerService.deleteInfluencer(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}/campaigns")
    public ResponseEntity<List<Campaing>> getInfluencerCampaigns(@PathVariable Integer id) {
        try {
            List<Campaing> campaigns = influencerService.getInfluencerCampaigns(id);
            return ResponseEntity.ok(campaigns);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
