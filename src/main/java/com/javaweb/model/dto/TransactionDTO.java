package com.javaweb.model.dto;

import lombok.*;


@Setter
@Getter
public class TransactionDTO extends AbstractDTO {
    private String note;
    private String code;
    private Long customerId;
}
