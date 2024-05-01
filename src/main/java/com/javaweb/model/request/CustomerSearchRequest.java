package com.javaweb.model.request;

import lombok.*;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerSearchRequest {
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;
}
