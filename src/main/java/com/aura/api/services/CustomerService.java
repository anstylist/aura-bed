package com.aura.api.services;


import com.aura.api.dto.auth.LoggedUser;
import com.aura.api.dto.auth.LoginUser;
import com.aura.api.dto.auth.RegisterRequest;
import com.aura.api.exceptions.ResourceNotFoundException;
import com.aura.api.models.Customer;
import com.aura.api.repositories.CustomerRepository;
import com.aura.api.utils.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    @Override
    public Optional<Customer> getCustomerById(Integer id) {
        return customerRepository.findById(id);
    }

    @Override
    public Customer createCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer getCustomerByEmail(String email) {
        return customerRepository.findByEmail(email);
    }

    public Customer registerUser(RegisterRequest newUser) {
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
        Customer user = customerRepository.findByEmail(loginUser.getEmail());
        if (user == null) {
            return null;
        }

        if (!user.getPassword().equals(passwordEncoder.encode(loginUser.getPassword()))) {
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

    @Override
    public Customer updateCustomer(Integer id, Customer customerDetails) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not found with id: " + id));


        customer.setEmail(customerDetails.getEmail());
        customer.setPassword(customerDetails.getPassword());
        customer.setFirstName(customerDetails.getFirstName());
        customer.setLastName(customerDetails.getLastName());
        customer.setCreatedAt(customerDetails.getCreatedAt());
        customer.setUpdatedAt(customerDetails.getUpdatedAt());

        return customerRepository.save(customer);
    }

    @Override
    public void deleteCustomer(Integer id) {
        customerRepository.deleteById(id);
    }
}
