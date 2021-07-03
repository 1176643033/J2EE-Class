package com.chieh.service.impl;

import com.chieh.dao.RoleDao;
import com.chieh.domain.Role;
import com.chieh.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    @Override
    public boolean addRole(Role role) {
        if (roleDao.selectByRname(role) == null){
            if (roleDao.insertRole(role) > 0) {return true;}
        }
        return false;
    }

    @Override
    public Map findRole(int pageSize, int pageNo) {
        Map<String,Object> map = new HashMap<>();
        int total = roleDao.countRoles();
        map.put("total",total);
        map.put("list",roleDao.queryRoles((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public Integer deleteRole(String[] rids) {
        Integer count = 0;
        for (int i=0; i < rids.length; i++){
            count += roleDao.deleteRole(rids[i]);
        }
        return count;
    }

    @Override
    public Role findByRid(String rid) {
        return  roleDao.selectByRid(rid);
    }

    @Override
    public boolean updateRole(Role role) {
        Integer rid = roleDao.selectByRname(role);
        //该部门名字不存在或和本did相同才进行更新操作
        if ( rid == null || rid == Integer.parseInt(role.getRid()) ){
            if(roleDao.updateRole(role) > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Role> findAll() {
        return roleDao.queryAll();
    }
}
