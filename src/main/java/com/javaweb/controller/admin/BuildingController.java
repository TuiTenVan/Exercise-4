package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.impl.BuildingServiceImpl;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Transactional
@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    public BuildingServiceImpl buildingService;
    @Autowired
    public UserService userService;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingAdmin(@ModelAttribute BuildingSearchRequest buildingSearchRequest,
                                      @RequestParam Map<String, Object> conditions,
                                      @RequestParam (name="typeCode", required = false) List<String> typeCode,
                                      @ModelAttribute(SystemConstant.MODEL) BuildingDTO model,
                                      HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        List<BuildingDTO> buildingDTOList = buildingService.findAll(conditions, typeCode);
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        for (BuildingDTO buildingDTO : buildingDTOList) {
            BuildingSearchResponse response = new BuildingSearchResponse();
            response.setId(buildingDTO.getId());
            response.setName(buildingDTO.getName());
            response.setAddress(buildingDTO.getAddress());
            response.setManagerPhone(buildingDTO.getManagerPhone());
            response.setNumberOfBasement(buildingDTO.getNumberOfBasement());
            response.setManagerName(buildingDTO.getManagerName());
            response.setServiceFee(buildingDTO.getServiceFee());
            response.setFloorArea(buildingDTO.getFloorArea());
            response.setRentArea(buildingDTO.getRentArea());
            responseList.add(response);
        }
        model.setMaxPageItems(4);
        model.setTotalItem(buildingDTOList.size());
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView editBuilding(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable("id") Long Id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.getBuilding(Id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }
}
