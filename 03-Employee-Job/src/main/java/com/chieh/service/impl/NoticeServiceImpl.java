package com.chieh.service.impl;

import com.chieh.dao.NoticeDao;
import com.chieh.domain.Notice;
import com.chieh.service.NoticeService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeDao noticeDao;
    @Override
    public List<Notice> findTop5Notices() {
        return noticeDao.queryTop5Notices();
    }

    @Override
    public boolean addNotice(Notice notice) {
        if (noticeDao.insertNotice(notice) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Map findNotice( int pageNo,int pageSize) {
        Map<String,Object> map = new HashMap<>();
        int total = noticeDao.countNotices();
        map.put("total",total);
        map.put("list",noticeDao.queryNotice((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public Integer deleteNotice(String id) {
        Integer count = 0;
        count += noticeDao.deleteNotice(id);
        return count;
    }


}
