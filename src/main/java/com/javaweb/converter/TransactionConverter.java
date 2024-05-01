package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class TransactionConverter {
    private final ModelMapper modelMapper;
    public TransactionEntity toTransactionEntity(TransactionDTO transactionDTO){
        return modelMapper.map(transactionDTO, TransactionEntity.class);
    }
    public TransactionDTO toTransactionDTO(TransactionEntity transactionEntity){
        return modelMapper.map(transactionEntity, TransactionDTO.class);
    }
}
