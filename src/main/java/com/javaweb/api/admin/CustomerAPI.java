package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.ICustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@Transactional
@RequestMapping("/api/customer")
@RequiredArgsConstructor
public class CustomerAPI {
    private final ICustomerService customerService;

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        customerService.addCustomer(customerDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        return customerService.listStaffs(id);
    }

    @DeleteMapping("/{ids}")
    public void DeleteCustomer(@PathVariable List<Long> ids){
        customerService.deleteCustomers(ids);
    }

    @PostMapping("/assignment")
    public void UpdateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.updateAssignmentCustomer(assignmentCustomerDTO);
    }
}