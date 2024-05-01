package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Transactional
@RestController(value="buildingControllerOfAdmin")
@RequiredArgsConstructor
public class BuildingController {
    public final IBuildingService buildingService;
    public final IUserService userService;
    public final BuildingSearchResponseConverter buildingSearchResponseConverter;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingAdmin(@ModelAttribute BuildingSearchRequest buildingSearchRequest,
                                      @RequestParam Map<String, Object> conditions,
                                      @RequestParam (name="typeCode", required = false) List<String> typeCode,
                                      @ModelAttribute(SystemConstant.MODEL) BuildingDTO model){
        ModelAndView mav = new ModelAndView("admin/building/list");
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            conditions.put("staffId", staffId);
        }
        List<BuildingDTO> buildingDTOList = buildingService.findAll(conditions, typeCode);
        for (BuildingDTO buildingDTO : buildingDTOList) {
            responseList.add(buildingSearchResponseConverter.converterResponse(buildingDTO));
        }
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("buildingList", responseList);
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView editBuilding(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable("id") Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.getBuilding(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }
}
