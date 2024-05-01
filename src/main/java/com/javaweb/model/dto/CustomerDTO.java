package com.javaweb.model.dto;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerDTO extends AbstractDTO{
    private String fullName;
    private String managementStaff;
    private String phone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
//    private String roleCode;
    private String content;
}
