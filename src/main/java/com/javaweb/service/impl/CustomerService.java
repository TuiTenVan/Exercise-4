package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustomerService implements ICustomerService {
    private final CustomerRepository customerRepository;
    private final CustomerConverter customerConverter;
    private final UserRepository userRepository;

    @Override
    public List<CustomerDTO> findCustomer(Map<String, String> params) {
        List<CustomerEntity> customerEntities = customerRepository.findCustomer(params);
        List<CustomerDTO> customerDTOList = new ArrayList<>();
        for (CustomerEntity customer : customerEntities) {
            CustomerDTO customerDTO = customerConverter.toCustomerDTO(customer);
            customerDTOList.add(customerDTO);
        }
        return customerDTOList;
    }

    @Override
    public void addCustomer(CustomerDTO customerDTO) {
          CustomerEntity customerEntity = null;
          if (customerDTO.getId() != null) {
              List<StaffResponseDTO> staffResponseDTOs = (List<StaffResponseDTO>) listStaffs(customerDTO.getId()).getData();
              List<UserEntity> staffEntities = new ArrayList<>();
              for (StaffResponseDTO staffResponseDTO : staffResponseDTOs) {
                  if (staffResponseDTO.getChecked().equals("checked")) {
                    Long staffId = staffResponseDTO.getStaffId();
                    userRepository.findById(staffId).ifPresent(staffEntities::add);
                  }
              }
              customerEntity = customerConverter.toCustomerEntity(customerDTO);
              customerEntity.setUserList(staffEntities);
          }
          else{
              customerEntity = customerConverter.toCustomerEntity(customerDTO);
          }
          customerRepository.save(customerEntity);
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customer.getUserList();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(it.getId());
            staffResponseDTO.setFullName(it.getFullName());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);;
        }
        responseDTO.setData(staffResponseDTOS);

        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        List<Long> staffIds = assignmentCustomerDTO.getStaffs();
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> userEntities = new ArrayList<>();
        for (Long userId : staffIds) {
            UserEntity userEntity = userRepository.findById(userId).get();
            userEntities.add(userEntity);
        }
        userRepository.saveAll(userEntities);
        customerEntity.setUserList(userEntities);
        customerRepository.save(customerEntity);
    }

    @Override
    public CustomerDTO findCustomerById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
        return customerConverter.toCustomerDTO(customerEntity);
    }

    @Override
    public void deleteCustomers(List<Long> ids) {
        for (Long id : ids) {
            CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
            if (customerEntity != null) {
                customerEntity.setActive(false);
                customerRepository.save(customerEntity);
            }
        }
    }
}
