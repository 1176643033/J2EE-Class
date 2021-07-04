package com.chieh.service.impl;

import com.chieh.dao.EmployeeDao;
import com.chieh.domain.Employee;
import com.chieh.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeDao employeeDao;

    @Override
    public boolean addEmployee(Employee employee) {
        if (employeeDao.insertEmployee(employee) > 0) {return true;}
        return false;
    }

    @Override
    public Map findEmployee(int pageSize, int pageNo) {
        Map<String,Object> map = new HashMap<>();
        int total = employeeDao.countEmployees();
        map.put("total",total);
        map.put("list",employeeDao.queryEmployees((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public Integer deleteEmployee(String[] ids) {
        Integer count = 0;
        for (int i=0; i < ids.length; i++){
            count += employeeDao.deleteEmployee(ids[i]);
        }
        return count;
    }

    @Override
    public Employee findById(String id) {
        return employeeDao.selectById(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        if(employeeDao.updateEmployee(employee) > 0){
            return true;
        }
        return false;
    }
}
