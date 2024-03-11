package com.javaweb.service;

import com.javaweb.model.response.ResponseDTO;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
}
