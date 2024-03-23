package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingDTOConverter buildingDTOConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UploadFileUtils uploadFileUtils;

    private String saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getAvatar()) {
                if (!path.equals(buildingEntity.getAvatar())) {
                    File file = new File("C://home/office" + buildingEntity.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setAvatar(path);
        }
        return path;
    }

    public void save(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = null;
        if (buildingDTO.getId() != null) {
            buildingEntity = buildingRepository.findById(buildingDTO.getId()).orElse(null);
//            rentAreaRepository.deleteByBuildingId(buildingDTO.getId());
        } else {
            buildingEntity = new BuildingEntity();
        }
//        buildingEntity.getBuildings().clear();
        buildingDTO.setAvatar(saveThumbnail(buildingDTO, buildingEntity));
        buildingEntity = buildingRepository.save(buildingDTOConverter.toBuildingEntity(buildingDTO));
        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
            List<RentAreaEntity> rentAreas = new ArrayList<>();
            for (String rentAreaValue : buildingDTO.getRentArea().split(",")) {
                rentAreaValue = rentAreaValue.trim();
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Integer.parseInt(rentAreaValue));
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreas.add(rentAreaEntity);
            }
            buildingEntity.setBuildings(rentAreas);
        }
    }
//public void save(BuildingDTO buildingDTO) {
//    BuildingEntity buildingEntity = null;
//
//    if (buildingDTO.getId() != null) {
//        // Nếu tòa nhà đã tồn tại, tìm và lấy thông tin của nó
//        buildingEntity = buildingRepository.findById(buildingDTO.getId()).orElse(null);
//        // Xóa tất cả các RentArea liên quan đến tòa nhà
//        if (buildingEntity != null) {
//            buildingEntity.getBuildings().clear();
//        }
//    } else {
//        // Nếu tòa nhà chưa tồn tại, tạo một tòa nhà mới
//        buildingEntity = new BuildingEntity();
//    }
//
//    // Thực hiện các thay đổi trên tòa nhà
//    buildingDTO.setAvatar(saveThumbnail(buildingDTO, buildingEntity));
//    buildingEntity = buildingRepository.save(buildingDTOConverter.toBuildingEntity(buildingDTO));
//
//    // Thêm các RentArea mới cho tòa nhà
//    if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
//        List<RentAreaEntity> rentAreas = new ArrayList<>();
//        for (String rentAreaValue : buildingDTO.getRentArea().split(",")) {
//            rentAreaValue = rentAreaValue.trim();
//            RentAreaEntity rentAreaEntity = new RentAreaEntity();
//            rentAreaEntity.setValue(Integer.parseInt(rentAreaValue));
//            rentAreaEntity.setBuilding(buildingEntity);
//            rentAreas.add(rentAreaEntity);
//        }
//        buildingEntity.setBuildings(rentAreas);
//    }
//}


    public List<BuildingDTO> findAll(Map<String, Object> params, List<String> typeCode){
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(params, typeCode);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingDTO> result = new ArrayList<>();
        for(BuildingEntity item : buildingEntities){
            BuildingDTO buildingDTO = buildingDTOConverter.toBuildingDTO(item);
            result.add(buildingDTO);
        }
        return result;
    }

    public BuildingDTO getBuilding(Long id){
        BuildingEntity building = buildingRepository.findById(id).get();
        return buildingDTOConverter.toBuildingDTO(building);
    }

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(it.getId());
            staffResponseDTO.setFullName(it.getFullName());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    public void deleteBuildings(List<Long> buildingIds) {
        buildingRepository.deleteAllByIdIn(buildingIds);
    }

    public void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        if (buildingEntity != null) {
            List<UserEntity> userEntities = new ArrayList<>();
            for (Long userId : staffIds) {
                UserEntity userEntity = userRepository.findById(userId).get();
                if (userEntity != null) {
                    userEntities.add(userEntity);
                }
            }
            userRepository.saveAll(userEntities);
            buildingEntity.setUserEntities(userEntities);
            buildingRepository.save(buildingEntity);
        } else {
            System.out.println("Building not found");
        }
    }
}
