package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.custom.BuildingRepositoreCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoreCustom {
    void deleteByIdIn(List<Long> ids);
    BuildingEntity findOneById(Long id);
    void deleteAllByIdIn(List<Long> buildingIds);
    Page<BuildingEntity> findByName(String name, Pageable pageable);

    Page<BuildingEntity> findById(Long i, Pageable pageable);
}
