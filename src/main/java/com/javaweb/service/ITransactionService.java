package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface ITransactionService {
    void saveTransaction(TransactionDTO transactionDTO);
    List<TransactionDTO> getAllTransaction(Long customerId);
    void updateTransaction(Long id, TransactionDTO transactionDTO);
    TransactionDTO getTransaction(Long id);
}
