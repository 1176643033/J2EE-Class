package com.chieh.service;

import com.chieh.domain.Dept;

import java.util.List;
import java.util.Map;

public interface DeptService {
    boolean addDept(Dept dept);
    Map findDept(int pageSize,int pageNo);
    Integer deleteDept(String[] dids);
    Dept findByDid(String did);
    boolean updateDept(Dept dept);
    List<Dept> findAll();
}
