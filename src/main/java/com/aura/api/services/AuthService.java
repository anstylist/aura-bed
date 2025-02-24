package com.aura.api.services;

import com.aura.api.dto.auth.LoggedUser;
import com.aura.api.dto.auth.LoginUser;
import com.aura.api.dto.auth.RegisterRequest;
import com.aura.api.exceptions.ExistentUserException;
import com.aura.api.models.Customer;
import com.aura.api.repositories.CustomerRepository;
import com.aura.api.utils.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AuthService implements IAuthService {

    @Autowired
    private JwtService jwtService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomerRepository customerRepository;

    public Customer registerUser(RegisterRequest newUser) {
        Customer existentUser = customerRepository.findByEmail(newUser.getEmail());
        if (existentUser != null) {
            throw new ExistentUserException("The user with the email "+newUser.getEmail()+" already exist");
        }

        Customer newCustomer = new Customer();
        newCustomer.setEmail(newUser.getEmail());
        newCustomer.setFirstName(newUser.getFirstName());
        newCustomer.setLastName(newUser.getLastName());
        newCustomer.setPassword(passwordEncoder.encode(newUser.getPassword()));
        newCustomer.setRole(Role.USER);

        newCustomer = customerRepository.save(newCustomer);

        return newCustomer;
    }

    public LoggedUser login(LoginUser loginUser) {
        Customer user = customerRepository.findByEmail(loginUser.getUsername());

        if (user == null) {
            return null;
        }

        if (!passwordEncoder.matches(loginUser.getPassword(), user.getPassword())) {
            return null;
        }

        String token = jwtService.generateToken(new HashMap<>(), user);

        LoggedUser loggedUser = new LoggedUser();

        loggedUser.setEmail(user.getEmail());
        loggedUser.setLastName(user.getLastName());
        loggedUser.setFirstName(user.getFirstName());
        loggedUser.setToken(token);

        return loggedUser;
    }
}
