package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaRepository  extends JpaRepository<RentAreaEntity, Long> {
//    RentAreaEntity findByBuildingId(Long id);
    void deleteByBuildingId(Long buildingId);
//    RentAreaEntity findBy
}
