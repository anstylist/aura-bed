package com.aura.api.services;

import com.aura.api.exceptions.ResourceNotFoundException;
import com.aura.api.models.Campaign;
import com.aura.api.models.DiscountCode;
import com.aura.api.models.Influencer;
import com.aura.api.repositories.CampaignRepository;
import com.aura.api.repositories.DiscountCodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountCodeService implements IDiscountCodeService {
    @Autowired
    private DiscountCodeRepository repository;

    @Override
    public DiscountCode getDiscountCodeByCode(String code) {
        return repository.findByCode(code);
    }
}
