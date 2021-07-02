package com.chieh.dao;

import com.chieh.domain.Dept;

import java.util.List;

public interface DeptDao {
    Integer insertDept(Dept dept);
    Integer selectByDname(Dept dept);
    List<Dept> queryDepts(int index,int pageSize);
    Integer countDepts();
    Integer deleteDept(String did);
    Dept selectByDid(String did);
    Integer updateDept(Dept dept);
}
