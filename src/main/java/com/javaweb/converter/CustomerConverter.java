package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CustomerConverter {
    private final ModelMapper modelMapper;

    public CustomerDTO toCustomerDTO(CustomerEntity customer){
        CustomerDTO customerDTO = modelMapper.map(customer, CustomerDTO.class);
        customerDTO.setCreatedDate(customer.getCreatedDate());
        customerDTO.setManagementStaff(customer.getCreatedBy());
        return customerDTO;
    }

    public CustomerSearchResponse toCustomerSearchResponse(CustomerDTO customerDTO){
        return modelMapper.map(customerDTO, CustomerSearchResponse.class);
    }
    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO){
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        customerEntity.setCreatedDate(customerDTO.getCreatedDate());
        customerEntity.setCreatedBy(customerDTO.getCreatedBy());
        return customerEntity;
    }
}
