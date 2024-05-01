package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<CustomerDTO> findCustomer(Map<String, String> params);
    void addCustomer(CustomerDTO customerDTO);
    CustomerDTO findCustomerById(Long id);
    void deleteCustomers(List<Long> ids);
    ResponseDTO listStaffs(Long customerId);
    void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
}
