package com.javaweb.converter;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingDTOConverter {
    @Autowired
    private  RentAreaDTOConverter rentAreaDTOConverter;
    @Autowired
    private ModelMapper modelMapper;
    public BuildingDTO toBuildingDTO(BuildingEntity item){
        BuildingDTO building = modelMapper.map(item, BuildingDTO.class);
        building.setAddress(item.getStreet() + ", " + item.getWard() + ", " + item.getDistrict());
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        List<String> typeCodes = new ArrayList<>();
        if(item.getTypeCode() != null && !item.getTypeCode().isEmpty()){
            String[] typeCode = item.getTypeCode().split(",");
            for(String type : typeCode){
                typeCodes.add(type);
            }
        }
        building.setTypeCode(typeCodes);
        String rentArea = rentAreas.stream().map(it->it.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(rentArea);
        return building;
    }
    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);
        String type = buildingDTO.getTypeCode().stream().map(it->it.toString()).collect(Collectors.joining(","));
        building.setRentAreaEntities(rentAreaDTOConverter.ConvertToEntity(buildingDTO, building));
        building.setAvatar(buildingDTO.getAvatar());
        building.setTypeCode(type);
        return building;
    }
}