package com.javaweb.repository.custom;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserRepositoryCustom {
	List<UserEntity> findByRole(String roleCode);
	List<UserEntity> getAllUsers(Pageable pageable);
	int countTotalItem();

}
