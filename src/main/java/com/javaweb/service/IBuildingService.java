package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingDTO> getBuildings(String searchName, Pageable pageable);
    Page<BuildingEntity> findAll(Pageable pageable);

    List<BuildingDTO> getAllBuilding(Pageable pageable);

    int countTotalItems();
}
