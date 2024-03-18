package com.javaweb.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Component

public class UploadFileUtils {
//    @Value("${upload.directory}")
//    private String uploadDir;
//    public static void saveFile(String uploadDir, String fileName, MultipartFile multipartFile) throws IOException {
//        Path uploadPath = Paths.get(uploadDir);
//
//        if(!Files.exists(uploadPath)){
//            Files.createDirectories(uploadPath);
//        }
//
//        try(InputStream inputStream = multipartFile.getInputStream()){
//            Path filePath = uploadPath.resolve(fileName);
//            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
//        }catch (IOException e){
//            throw new IOException("Could not save File: " + fileName, e);
//        }
//    }
}
