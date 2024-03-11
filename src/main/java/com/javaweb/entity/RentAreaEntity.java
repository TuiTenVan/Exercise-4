package com.javaweb.entity;


import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity building;

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
    }

    @Column(name = "value", nullable = false)
    private Integer value;

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

//    public Integer getBuildingId() {
//        return buildingId;
//    }
//
//    public void setBuildingId(Integer buildingId) {
//        this.buildingId = buildingId;
//    }
}