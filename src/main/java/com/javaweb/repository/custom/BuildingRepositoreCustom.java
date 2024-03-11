package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;

import java.util.List;

public interface BuildingRepositoreCustom {
    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder);

}
