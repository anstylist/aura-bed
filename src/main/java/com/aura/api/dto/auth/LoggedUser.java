package com.aura.api.dto.auth;

import lombok.Data;

@Data
public class LoggedUser {
    private String lastName;
    private String firstName;
    private String email;
    private String token;
}
