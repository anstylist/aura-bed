package com.aura.api.services;

import com.aura.api.dto.auth.LoggedUser;
import com.aura.api.dto.auth.LoginUser;
import com.aura.api.dto.auth.RegisterRequest;
import com.aura.api.models.Customer;

public interface IAuthService {
    public Customer registerUser(RegisterRequest newUser);

    public LoggedUser login(LoginUser loginUser);
}
