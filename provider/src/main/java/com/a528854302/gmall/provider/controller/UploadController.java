package com.a528854302.gmall.provider.controller;

import com.a528854302.common.utils.R;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @ClassName UploadController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/12
 **/
@RestController
@RequestMapping("provider")
public class UploadController {

    @Value("${my-upload.upload-dir}")
    private String uploadDir;

    @Value("${my-upload.access-url}")
    private String accessUrl;

    @Value(("${server.port}"))
    private String port;

    @PostMapping("/upload")
    public Map upload(@RequestParam("file") MultipartFile file, HttpServletRequest request){
        String originalFileName = file.getOriginalFilename();
        String fileSufix = originalFileName.substring(originalFileName.lastIndexOf("."));
        if (!new File(uploadDir).exists()){
            new File(uploadDir).mkdirs();
        }
        String uploadFileName= UUID.randomUUID().toString().substring(0, 10) + fileSufix;
        String uploadPath = uploadDir  + uploadFileName;

        try {
            file.transferTo(new File(uploadPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String url = "http://localhost:"+port+accessUrl+uploadFileName;
        HashMap<String, Object> map = new HashMap<>();
        map.put("url",url);
        return R.ok().put("data",map);
    }
}
