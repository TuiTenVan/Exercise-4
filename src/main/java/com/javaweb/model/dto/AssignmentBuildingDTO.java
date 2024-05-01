package com.javaweb.model.dto;

import lombok.*;

import java.util.List;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AssignmentBuildingDTO {
    private Long buildingId;
    private List<Long> staffs;
}
