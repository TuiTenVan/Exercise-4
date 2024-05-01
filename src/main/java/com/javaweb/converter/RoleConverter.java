package com.javaweb.converter;

import com.javaweb.model.dto.RoleDTO;
import com.javaweb.entity.RoleEntity;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleConverter {
	private final ModelMapper modelMapper;

	public RoleDTO convertToDto(RoleEntity entity) {
        return modelMapper.map(entity, RoleDTO.class);
    }
    public RoleEntity convertToEntity(RoleDTO dto) {
        return modelMapper.map(dto, RoleEntity.class);
    }
}
