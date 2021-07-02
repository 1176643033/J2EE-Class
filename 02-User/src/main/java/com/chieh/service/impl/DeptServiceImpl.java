package com.chieh.service.impl;

import com.chieh.dao.DeptDao;
import com.chieh.domain.Dept;
import com.chieh.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class DeptServiceImpl implements DeptService {

    //引用类型的自动注入@Autowired, @Resource
    @Resource
    private DeptDao deptDao;

    @Override
    public boolean addDept(Dept dept) {
        //先查看部门名是否已存在, 不存在同名才往下执行
        if (deptDao.selectByDname(dept) == 0){
            if (deptDao.insertDept(dept) > 0) {return true;}
        }
        return false;
    }

    @Override
    public Map findDept(int pageSize, int pageNo) {
        Map<String,Object> map = new HashMap<>();
        int total = deptDao.countDepts();
        map.put("total",total);
        map.put("list",deptDao.queryDepts((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public Integer deleteDept(String[] dids) {
        Integer count = 0;
        for (int i=0; i < dids.length; i++){
            count += deptDao.deleteDept(dids[i]);
        }
        return count;
    }

    @Override
    public Dept findByDid(String did) {
        return deptDao.selectByDid(did);
    }

    @Override
    public boolean updateDept(Dept dept) {
        Integer did = deptDao.selectByDname(dept);
        //该部门名字不存在或和本did相同才进行更新操作
        if ( did == 0 || did == Integer.parseInt(dept.getDid()) ){
            if(deptDao.updateDept(dept) > 0){
                return true;
            }
        }
        return false;
    }
}
