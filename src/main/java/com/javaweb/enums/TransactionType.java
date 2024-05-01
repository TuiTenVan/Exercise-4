package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");

    private final String name;
    TransactionType(String name) {
        this.name = name;
    }

    public static Map<String, String> transactonTypes() {
        Map<String, String> transactionTypes = new LinkedHashMap<>();
        for (TransactionType type : TransactionType.values()) {
            transactionTypes.put(type.toString(), type.name);
        }
        return transactionTypes;
    }
}
