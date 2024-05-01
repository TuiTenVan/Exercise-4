package com.javaweb.model.response;

import com.javaweb.entity.UserEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class ResponseDTO {
    private Object data;
    private String message;
    private String detail;
}
