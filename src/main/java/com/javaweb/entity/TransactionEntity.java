package com.javaweb.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "transaction")
public class TransactionEntity extends BaseEntity {
    private String code;
    private String note;
    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customer;
}
