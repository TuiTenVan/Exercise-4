package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CustomerRepositoryCustom{
    List<CustomerEntity> findCustomer(@RequestParam Map<String, String> conditions);
}
