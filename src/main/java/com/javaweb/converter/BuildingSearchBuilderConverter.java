package com.javaweb.converter;


import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

// hứng các field từ params
@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String, Object> params, List<String> typeCode){
        return new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params, "name", String.class))
                .setFloorArea(MapUtils.getObject(params, "floorArea", Integer.class))
                .setNumberOfBasement(MapUtils.getObject(params, "numberOfBasement", Integer.class))
                .setWard(MapUtils.getObject(params, "ward", String.class))
                .setDistrict(MapUtils.getObject(params, "district", String.class))
                .setStreet(MapUtils.getObject(params, "street", String.class))
                .setManagerName(MapUtils.getObject(params, "managerName", String.class))
                .setManagerPhoneNumber(MapUtils.getObject(params, "managerPhoneNumber", String.class))
                .setDirection(MapUtils.getObject(params, "direction", String.class))
                .setLevel(MapUtils.getObject(params, "level", String.class))
                .setRentPriceFrom(MapUtils.getObject(params, "rentPriceFrom", Integer.class))
                .setRentPriceTo(MapUtils.getObject(params, "rentPriceTo", Integer.class))
                .setAreaFrom(MapUtils.getObject(params, "areaFrom", Integer.class))
                .setAreaTo(MapUtils.getObject(params, "areaTo", Integer.class))
                .setStaffId(MapUtils.getObject(params, "staffId", Integer.class))
                .setTypeCode(typeCode)
                .build();
    }
}