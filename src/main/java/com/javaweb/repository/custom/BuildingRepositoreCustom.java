package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoreCustom {
    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder);
    List<BuildingEntity> getAllBuildings(Pageable pageable);

    int countTotalItem();
}
