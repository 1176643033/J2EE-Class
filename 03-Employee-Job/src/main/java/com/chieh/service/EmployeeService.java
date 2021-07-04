package com.chieh.service;

import com.chieh.domain.Employee;

import java.util.Map;

public interface EmployeeService {
    boolean addEmployee(Employee employee);
    Map findEmployee(int pageSize, int pageNo);
    Integer deleteEmployee(String[] ids);
    Employee findById(String id);
    boolean updateEmployee(Employee employee);
}
