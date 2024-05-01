package com.javaweb.converter;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchResponseConverter {
    public BuildingSearchResponse converterResponse(BuildingDTO buildingDTO){
        BuildingSearchResponse response = new BuildingSearchResponse();
        response.setId(buildingDTO.getId());
        response.setName(buildingDTO.getName());
        response.setAddress(buildingDTO.getAddress());
        response.setManagerPhone(buildingDTO.getManagerPhone());
        response.setNumberOfBasement(buildingDTO.getNumberOfBasement());
        response.setManagerName(buildingDTO.getManagerName());
        response.setServiceFee(buildingDTO.getServiceFee());
        response.setFloorArea(buildingDTO.getFloorArea());
        response.setRentArea(buildingDTO.getRentArea());
        return response;
    }
}
