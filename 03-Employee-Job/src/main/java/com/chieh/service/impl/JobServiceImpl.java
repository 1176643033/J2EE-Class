package com.chieh.service.impl;

import com.chieh.dao.JobDao;
import com.chieh.domain.Job;
import com.chieh.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobServiceImpl implements JobService {
    
    @Resource
    private JobDao jobDao;
    
    @Override
    public boolean addJob(Job job) {
        if (jobDao.selectByJname(job) == null){
            if (jobDao.insertJob(job) > 0) {return true;}
        }
        return false;
    }

    @Override
    public Map findJob(int pageSize, int pageNo) {
        Map<String,Object> map = new HashMap<>();
        int total = jobDao.countJobs();
        map.put("total",total);
        map.put("list",jobDao.queryJobs((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public Integer deleteJob(String[] jids) {
        Integer count = 0;
        for (int i=0; i < jids.length; i++){
            count += jobDao.deleteJob(jids[i]);
        }
        return count;
    }

    @Override
    public Job findByJid(String jid) {
        return jobDao.selectByJid(jid);
    }

    @Override
    public boolean updateJob(Job job) {
        Integer jid = jobDao.selectByJname(job);
        //该工作名字不存在或和本did相同才进行更新操作
        if ( jid == null || jid == Integer.parseInt(job.getJid()) ){
            if(jobDao.updateJob(job) > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Job> findAll() {
        return jobDao.queryAll();
    }
}
