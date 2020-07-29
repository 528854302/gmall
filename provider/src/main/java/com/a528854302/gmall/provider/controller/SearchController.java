package com.a528854302.gmall.provider.controller;

import com.a528854302.gmall.provider.service.SearchService;
import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName SearchController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@RestController
@RequestMapping("provider")
public class SearchController {
    @Autowired
    SearchService searchService;

    @RequestMapping("/search")
    public SearchResult search(@RequestBody(required = false) SearchParam searchParam){
        return searchService.search(searchParam);

    }
}
