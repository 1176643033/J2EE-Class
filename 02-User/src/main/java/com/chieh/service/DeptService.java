package com.chieh.service;

import com.chieh.domain.Dept;

import java.util.Map;

public interface DeptService {
    boolean addDept(Dept dept);
    Map findDept(int PageSize,int PageNo);
    Integer deleteDept(String[] dids);
    Dept findByDid(String did);
    boolean updateDept(Dept dept);
}
