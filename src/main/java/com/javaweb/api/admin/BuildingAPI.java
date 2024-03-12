package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.impl.BuildingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@RestController(value = "buildingApiOfBuilding")
@Transactional
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingServiceImpl buildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        buildingService.save(buildingDTO);
    }
    @DeleteMapping("/{ids}")
    public void DeleteBuilding(@PathVariable List<Long> ids){
        buildingService.deleteBuildings(ids);
        System.out.println("OK");
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
    @PostMapping("/assignment")
    public void UpdateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.updateAssignment(assignmentBuildingDTO);
    }
}
