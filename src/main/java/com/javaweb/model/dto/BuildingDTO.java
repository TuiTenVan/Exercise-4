package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class BuildingDTO extends AbstractDTO{
    private String name;
    private String district;
    private String ward;
    private String street;
    private String structure;
    private String Address;
    private Long numberOfBasement;
    private Integer floorArea;
    private String direction;
    private String level;
    private String rentArea;
    private Integer rentPrice;
    private String rentPriceDescription;
    private String serviceFee;
    private String carFee;
    private String motoFee;
    private String overtimeFee;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private String managerName;
    private String managerPhone;
    private Integer brokerageFee;
    private String note;
    private List<String> typeCode;
    private String avatar;
    private String imageBase64;
    private String imageName;
}