package com.aura.api.controllers;

import com.aura.api.dto.auth.LoggedUser;
import com.aura.api.dto.auth.LoginUser;
import com.aura.api.dto.auth.RegisterRequest;
import com.aura.api.dto.auth.RegisteredUser;
import com.aura.api.models.Customer;
import com.aura.api.services.CustomerService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/register")
    public ResponseEntity<RegisteredUser> register(@Valid @RequestBody RegisterRequest newUser) {
        Customer user = customerService.registerUser(newUser);
        return ResponseEntity.status(HttpStatus.CREATED).body(new RegisteredUser(user));
    }

    @PostMapping("/login")
    public ResponseEntity<LoggedUser> login(@Valid @RequestBody LoginUser loginUser) {
        LoggedUser loggedUser = customerService.login(loginUser);
        if (loggedUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }

        return ResponseEntity.ok(loggedUser);
    }
}

