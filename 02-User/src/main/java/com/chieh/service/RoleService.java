package com.chieh.service;

import com.chieh.domain.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {
    boolean addRole(Role role);
    Map findRole(int pageSize, int pageNo);
    Integer deleteRole(String[] rids);
    Role findByRid(String rid);
    boolean updateRole(Role role);
    List<Role> findAll();
}
