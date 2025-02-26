package com.aura.api.services;

import com.aura.api.models.DiscountCode;

public interface IDiscountCodeService {
    DiscountCode getDiscountCodeByCode(String code);
}
