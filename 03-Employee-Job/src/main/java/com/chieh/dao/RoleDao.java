package com.chieh.dao;

import com.chieh.domain.Dept;
import com.chieh.domain.Role;

import java.util.List;

public interface RoleDao {
    Integer insertRole(Role role);
    Integer selectByRname(Role role);
    List<Role> queryRoles(int index,int pageSize);
    Integer countRoles();
    Integer deleteRole(String rid);
    Role selectByRid(String rid);
    Integer updateRole(Role role);
    List<Role> queryAll();
}
