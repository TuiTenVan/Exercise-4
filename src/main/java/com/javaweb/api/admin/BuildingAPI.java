package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;

import com.javaweb.service.IBuildingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController(value = "buildingApiOfBuilding")
@Transactional
@RequestMapping("/api/building")
@RequiredArgsConstructor
public class BuildingAPI {
    private final IBuildingService buildingService;

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
        return buildingService.listStaffs(id);
    }
    @PostMapping("/assignment")
    public void UpdateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.updateAssignment(assignmentBuildingDTO);
    }
}
