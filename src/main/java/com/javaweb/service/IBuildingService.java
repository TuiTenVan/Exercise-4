package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    void save(BuildingDTO buildingDTO);
    void deleteBuildings(List<Long> buildingIds);
    void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO);
    List<BuildingDTO> findAll(Map<String, Object> params, List<String> typeCode);
    BuildingDTO getBuilding(Long id);
}
