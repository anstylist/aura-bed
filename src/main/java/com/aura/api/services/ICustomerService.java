package com.aura.api.services;


import com.aura.api.models.Customer;

import java.util.List;
import java.util.Optional;

public interface ICustomerService {

    List<Customer> getAllCustomers();

    Optional<Customer> getCustomerById(Integer id);

    Customer createCustomer(Customer customer);

    Customer updateCustomer(Integer id, Customer customerDetails);

    void deleteCustomer(Integer id);

    Customer getCustomerByEmail(String email);
}


