package com.aura.api.exceptions;

public class ExistentUserException extends RuntimeException {
    public ExistentUserException(String message) {
        super(message);
    }
}
