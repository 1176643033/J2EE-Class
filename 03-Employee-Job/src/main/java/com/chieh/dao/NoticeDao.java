package com.chieh.dao;

import com.chieh.domain.Notice;
import com.chieh.domain.Role;

import java.util.List;

public interface NoticeDao {
    List<Notice> queryTop5Notices();
    Integer insertNotice(Notice notice);
    List<Notice> queryNotice(int index, int pageSize);
    Integer countNotices();
}
