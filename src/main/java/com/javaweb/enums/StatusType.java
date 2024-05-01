package com.javaweb.enums;

import com.fasterxml.jackson.annotation.JsonValue;

import java.util.LinkedHashMap;
import java.util.Map;

public enum StatusType {
    DXL("Đang xử lý"),
    XL("Đã xử lý"),
    CXL("Chưa xử lý");

    private final String status;
    StatusType(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public static Map<String, String> statusTypes(){
        Map<String, String> map = new LinkedHashMap<>();
        for(StatusType statusType : StatusType.values()){
            map.put(statusType.getStatus(), statusType.status);
        }
        return map;
    }
}
