package com.javaweb.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity building;

    @Column(name = "value", nullable = false)
    private Integer value;

}