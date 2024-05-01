package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TransactionService implements ITransactionService {
    private final TransactionRepository transactionRepository;
    private final TransactionConverter transactionConverter;

    @Override
    public void saveTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transaction = transactionConverter.toTransactionEntity(transactionDTO);
        transactionRepository.save(transaction);
    }

    @Override
    public List<TransactionDTO> getAllTransaction(Long customerId) {
        List<TransactionEntity> transactionEntityList = transactionRepository.findAllByCustomerId(customerId);
        List<TransactionDTO> transactionDTOS = new ArrayList<>();
        for (TransactionEntity transactionEntity : transactionEntityList) {
            transactionDTOS.add(transactionConverter.toTransactionDTO(transactionEntity));
        }
        return transactionDTOS;
    }

    @Override
    public void updateTransaction(Long id, TransactionDTO transactionDTO) {
        TransactionEntity tEntity = transactionRepository.findById(id).get();
        tEntity.setNote(transactionDTO.getNote());
        transactionRepository.save(tEntity);
    }

    @Override
    public TransactionDTO getTransaction(Long id) {
        TransactionEntity transaction = transactionRepository.findById(id).orElse(null);
        return transactionConverter.toTransactionDTO(transaction);
    }
}
