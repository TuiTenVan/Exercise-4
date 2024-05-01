package com.javaweb.model.dto;

import lombok.*;

import java.util.List;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AssignmentCustomerDTO {
    private Long customerId;
    private List<Long> staffs;
}
