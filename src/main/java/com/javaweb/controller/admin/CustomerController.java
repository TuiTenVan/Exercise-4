package com.javaweb.controller.admin;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.enums.StatusType;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.TransactionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class CustomerController {
    private final ICustomerService customerService;
    public final IUserService userService;
    public final CustomerConverter customerConverter;
    public final TransactionService transactionService;

    @GetMapping(value = "/admin/customer-list")
    public ModelAndView customer(@ModelAttribute CustomerSearchRequest customerSearchRequest,
                                 @RequestParam Map<String, String> params){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        List<CustomerSearchResponse> responseList = new ArrayList<>();
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            params.put("staffId", String.valueOf(staffId));
        }
        List<CustomerDTO> customerDTOS = customerService.findCustomer(params);
        for(CustomerDTO customer : customerDTOS){
            CustomerSearchResponse customerSearchResponse = customerConverter.toCustomerSearchResponse(customer);
            responseList.add(customerSearchResponse);
        }
        mav.addObject("modelSearch", customerSearchRequest);
        mav.addObject("customerList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute("customerEdit") CustomerDTO customerDTO){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statusType", StatusType.statusTypes());
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView editCustomer(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findCustomerById(id);
        List<TransactionDTO> transactionDTOS = transactionService.getAllTransaction(id);
        mav.addObject("transactionDTOS", transactionDTOS);
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", TransactionType.transactonTypes());
        mav.addObject("statusType", StatusType.statusTypes());
        return mav;
    }
}
