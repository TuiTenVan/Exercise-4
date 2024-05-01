package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.service.ITransactionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;

@RestController
@Transactional
@RequestMapping("/api/transaction")
@RequiredArgsConstructor
public class TransactionAPI {
    private final ITransactionService transactionService;

    @PostMapping
    public void AddTransaction(@RequestBody TransactionDTO transactionDTO){
        transactionService.saveTransaction(transactionDTO);
    }
    @PutMapping("/{id}")
    public void UpdateTransaction(@PathVariable Long id, @RequestBody TransactionDTO transactionDTO){
        transactionService.updateTransaction(id, transactionDTO);
    }
    @GetMapping("/{id}/note")
    public TransactionDTO loadTransaction(@PathVariable Long id){
        return transactionService.getTransaction(id);
    }
}
