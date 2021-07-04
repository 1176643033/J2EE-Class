package com.chieh.service;

import com.chieh.domain.Job;

import java.util.List;
import java.util.Map;

public interface JobService {
    boolean addJob(Job job);
    Map findJob(int pageSize, int pageNo);
    Integer deleteJob(String[] jids);
    Job findByJid(String jid);
    boolean updateJob(Job job);
    List<Job> findAll();
}
