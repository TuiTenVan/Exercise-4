package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class RentAreaDTOConverter {
    public List<RentAreaEntity> ConvertToEntity(BuildingDTO buildingDTO, BuildingEntity buildingEntity){
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        if(StringUtils.check(buildingDTO.getRentArea())){
            String[] arr = buildingDTO.getRentArea().split(",");
            for(String item : arr){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuilding(buildingEntity);
                item = item.trim();
                rentAreaEntity.setValue(Integer.parseInt(item));
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        return rentAreaEntities;
    }
}
