package com.aura.api.controllers;

import com.aura.api.dto.auth.LoggedUser;
import com.aura.api.dto.auth.LoginUser;
import com.aura.api.dto.auth.RegisterRequest;
import com.aura.api.dto.auth.RegisteredUser;
import com.aura.api.exceptions.ExistentUserException;
import com.aura.api.models.Customer;
import com.aura.api.services.IAuthService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private IAuthService authService;

    @PostMapping("/register")
    @Operation(summary = "Register a new User")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest newUser) {
        try {
            Customer user = authService.registerUser(newUser);
            return ResponseEntity.status(HttpStatus.CREATED).body(new RegisteredUser(user));
        } catch (ExistentUserException e) {
            HashMap<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", e.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse);
        }
    }

    @PostMapping("/login")
    @Operation(summary = "Login a User")
    public ResponseEntity<LoggedUser> login(@Valid @RequestBody LoginUser loginUser) {
        LoggedUser loggedUser = authService.login(loginUser);
        if (loggedUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }

        return ResponseEntity.ok(loggedUser);
    }
}

