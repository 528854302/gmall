package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;

public interface SearchService {
    SearchResult search(SearchParam searchParam);
}
