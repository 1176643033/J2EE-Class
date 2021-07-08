package com.chieh.service;

import com.chieh.domain.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    List<Notice> findTop5Notices();
    boolean addNotice(Notice notice);
    Map findNotice( int pageNo,int pageSize);
}
