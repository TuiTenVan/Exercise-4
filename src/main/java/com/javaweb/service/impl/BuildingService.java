package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Service;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BuildingService implements IBuildingService {
    private final BuildingRepository buildingRepository;
    private final UserRepository userRepository;
    private final BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    private final BuildingConverter buildingDTOConverter;
    private final UploadFileUtils uploadFileUtils;

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
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
    }

    @Override
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = null;
        if (buildingDTO.getId() != null) {
            List<StaffResponseDTO> staffResponseDTOs = (List<StaffResponseDTO>) listStaffs(buildingDTO.getId()).getData();
            List<UserEntity> staffEntities = new ArrayList<>();
            for (StaffResponseDTO staffResponseDTO : staffResponseDTOs) {
                if (staffResponseDTO.getChecked().equals("checked")) {
                    Long staffId = staffResponseDTO.getStaffId();
                    userRepository.findById(staffId).ifPresent(staffEntities::add);
                }
            }
            buildingEntity = buildingDTOConverter.toBuildingEntity(buildingDTO);
            buildingEntity.setUserEntities(staffEntities);
        } else {
            buildingEntity = buildingDTOConverter.toBuildingEntity(buildingDTO);
        }
        saveThumbnail(buildingDTO, buildingEntity);
        buildingRepository.save(buildingEntity);
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
            staffResponseDTOS.add(staffResponseDTO);;
        }
        responseDTO.setData(staffResponseDTOS);

        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
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

    @Override
    public BuildingDTO getBuilding(Long id){
        BuildingEntity building = buildingRepository.findById(id).orElse(null);
        return buildingDTOConverter.toBuildingDTO(building);
    }

    @Override
    public void deleteBuildings(List<Long> buildingIds) {
        buildingRepository.deleteAllByIdIn(buildingIds);
    }

    @Override
    public void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntities = new ArrayList<>();
        for (Long userId : staffIds) {
            UserEntity userEntity = userRepository.findById(userId).get();
            userEntities.add(userEntity);
        }
        userRepository.saveAll(userEntities);
        buildingEntity.setUserEntities(userEntities);
        buildingRepository.save(buildingEntity);
    }
}
