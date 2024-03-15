package com.javaweb.controller.admin;



import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.impl.BuildingServiceImpl;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import com.javaweb.utils.UploadFileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    public BuildingServiceImpl buildingService;
    @Autowired
    public UserService userService;
    @Autowired
    private MessageUtils messageUtil;
    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingAdmin(@ModelAttribute BuildingSearchRequest buildingSearchRequest,
                                      @RequestParam Map<String, Object> conditions,
                                      @RequestParam (name="typeCode", required = false) List<String> typeCode,
                                      @ModelAttribute(SystemConstant.MODEL) BuildingDTO model
                                        , HttpServletRequest request){
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
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("district", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        DisplayTagUtils.of(request, model);
        List<BuildingDTO> news = buildingService.getAllBuilding(PageRequest.of(model.getPage() - 1, model.getMaxPageItems()));
        model.setListResult(news);
        model.setTotalItems(buildingService.countTotalItems());
        mav.addObject(SystemConstant.MODEL, model);
        initMessageResponse(mav, request);
        return mav;
    }
    public static String UPLOAD_DIRECTORY = System.getProperty("user.dir") + "/uploads";

    @RequestMapping(method = RequestMethod.POST, value = "/admin/building-edit")
    public String addBuilding(@ModelAttribute BuildingDTO buildingDTO, @RequestParam("image")MultipartFile multipartFile) throws IOException {
        if(!multipartFile.isEmpty()){
            buildingService.save(buildingDTO);
            String tmp = StringUtils.clean(multipartFile.getOriginalFilename());
            String fileName = (buildingDTO.getName() + buildingDTO.getId()) + tmp.substring(tmp.lastIndexOf("."));
            buildingDTO.setAvatar(fileName);
            String upload = Paths.get("src", "main", "resources", "static", "admin", "assets", "avatars").toString();
            UploadFileUtils.saveFile(upload, fileName, multipartFile);
        }
        buildingService.save(buildingDTO);
        return "redirect:/admin/building-list";
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
    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }
}
