package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
public class BuildingEntity extends BaseEntity {
    @Column(name = "name")
    private String name;
    @Column(name = "street")
    private String street;
    @Column(name = "ward")
    private String ward;
    @Column(name = "district")
    private String district;
    @Column(name = "structure")
    private String structure;
    @Column(name = "numberofbasement")
    private Long numberOfBasement;
    @Column(name = "floorarea")
    private Integer floorArea;
    @Column(name = "direction")
    private String direction;
    @Column(name = "level")
    private String level;
    @Column(name = "rentprice")
    private Integer rentPrice;
    @Column(name = "rentpricedescription")
    private String rentPriceDescription;
    @Column(name = "servicefee")
    private String serviceFee;
    @Column(name = "carfee")
    private String carFee;
    @Column(name = "motofee")
    private String motoFee;
    @Column(name = "overtimefee")
    private String overtimeFee;
    @Column(name = "waterfee")
    private String waterFee;
    @Column(name = "electricityfee")
    private String electricityFee;
    @Column(name = "deposit")
    private String deposit;
    @Column(name = "payment")
    private String payment;
    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;
    @Column(name = "brokeragetee")
    private Integer brokerageFee;
    @Column(name = "type")
    private String typeCode;
    @Column(name = "avatar")
    private String avatar;
    @Column(name = "managername")
    private String managerName;
    @Column(name = "managerphone")
    private String managerPhone;

    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

    public List<RentAreaEntity> getRentAreaEntities() {
        return rentAreaEntities;
    }

    public void setRentAreaEntities(List<RentAreaEntity> rentAreaEntities) {
        this.rentAreaEntities = rentAreaEntities;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentbuilding",
                joinColumns = @JoinColumn(name = "buildingid", nullable = false),
                inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false)
    )

    private List<UserEntity> userEntities = new ArrayList<>();

    public String getDistrict() {
        return district;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Integer getBrokerageFee() {
        return brokerageFee;
    }

    public void setBrokerageFee(Integer brokerageFee) {
        this.brokerageFee = brokerageFee;
    }

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }


    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }


    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }



    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getRentPriceDescription() {
        return rentPriceDescription;
    }

    public void setRentPriceDescription(String rentPriceDescription) {
        this.rentPriceDescription = rentPriceDescription;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public String getCarFee() {
        return carFee;
    }

    public void setCarFee(String carFee) {
        this.carFee = carFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public String getOvertimeFee() {
        return overtimeFee;
    }

    public void setOvertimeFee(String overtimeFee) {
        this.overtimeFee = overtimeFee;
    }

    public String getWaterFee() {
        return waterFee;
    }

    public void setWaterFee(String waterFee) {
        this.waterFee = waterFee;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public String getDecorationTime() {
        return decorationTime;
    }
    public void setDecorationTime(String decorationTime) {
        this.decorationTime = decorationTime;
    }



    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }


}
