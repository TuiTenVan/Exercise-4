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
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
    private final ResourceLoader resourceLoader;

    public BuildingServiceImpl(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    public String saveFile(MultipartFile file) throws IOException {
        String originalFilename = StringUtils.clean(file.getOriginalFilename());
        Path uploadPath = Paths.get(resourceLoader.getResource("classpath:/static/admin/assets/avatars/").getURI());
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        try (InputStream inputStream = file.getInputStream()) {
            Path filePath = uploadPath.resolve(originalFilename);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new IOException("Không thể lưu tệp: " + originalFilename, e);
        }
        return originalFilename;
    }
    public void save(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = null;
        if (buildingDTO.getId() != null) {
            buildingEntity = buildingRepository.findById(buildingDTO.getId()).orElse(null);
            rentAreaRepository.deleteByBuildingId(buildingDTO.getId());
        } else {
            buildingEntity = new BuildingEntity();
        }
        String avatarPath = buildingDTO.getAvatar();
        if (avatarPath != null && !avatarPath.isEmpty()) {
            buildingDTO.setAvatar(avatarPath);
        }
        buildingEntity.setAvatar(avatarPath);
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
            rentAreaRepository.saveAll(rentAreas);
            buildingEntity.setBuildings(rentAreas);
        }
    }
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

//    public void deleteBuildings(List<Long> buildingIds) {
//        for(Long id : buildingIds){
//            rentAreaRepository.deleteByBuildingId(id);
//        }
//        buildingRepository.deleteAllByIdIn(buildingIds);
//    }
    public void deleteBuildings(List<Long> buildingIds) {
        for (Long id : buildingIds) {
            buildingRepository.deleteById(id);
        }
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
