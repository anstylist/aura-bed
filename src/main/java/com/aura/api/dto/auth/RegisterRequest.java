package com.aura.api.dto.auth;

import jakarta.validation.constraints.*;
import lombok.Data;


@Data
public class RegisterRequest {
    @NotBlank(message = "The Email is required")
    @Email(message = "The Email format is not valid")
    private String email;

    @NotBlank(message = "The password is required")
    @Size(min = 6, max = 20, message = "The password must be between 6 end 20 characters")
    private String password;

    @NotBlank(message = "The first name is required")
    @Size(min = 1, max = 50, message = "The first name must be between 1 end 50 characters" )
    private String firstName;

    @Size(min = 1, max = 50, message = "The last name must be between 1 end 50 characters" )
    private String lastName;
}
