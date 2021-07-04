package com.chieh.dao;

import com.chieh.domain.Job;

import java.util.List;

public interface JobDao {
    Integer insertJob(Job job);
    Integer selectByJname(Job job);
    List<Job> queryJobs(int index, int pageSize);
    Integer countJobs();
    Integer deleteJob(String jid);
    Job selectByJid(String jid);
    Integer updateJob(Job job);
    List<Job> queryAll();
}
