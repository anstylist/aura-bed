package com.aura.api.controllers;

import com.aura.api.models.Campaign;
import com.aura.api.models.DiscountCode;
import com.aura.api.models.Influencer;
import com.aura.api.services.ICampaignService;
import com.aura.api.services.IDiscountCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/discount-code")
public class DiscountCodeController {

    @Autowired
    private IDiscountCodeService service;

    @GetMapping("/{code}")
    public ResponseEntity<DiscountCode> getDiscountCodeByCode(@PathVariable String code) {
        DiscountCode discountCode = service.getDiscountCodeByCode(code);
        if (discountCode == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(discountCode);
    }
}

