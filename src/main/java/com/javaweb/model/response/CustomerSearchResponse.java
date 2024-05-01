package com.javaweb.model.response;

import lombok.*;

import java.util.Date;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerSearchResponse {
    private Long id;
    private String fullName;
    private String phone;
    private String email;
    private String demand;
    private String status;
    private String managementStaff;
    private Date createdDate;
    private String roleCode;
}
