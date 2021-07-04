package com.chieh.dao;

import com.chieh.domain.Employee;

import java.util.List;

public interface EmployeeDao {
    Integer insertEmployee(Employee employee);

    List<Employee> queryEmployees(int index, int pageSize);
    Integer countEmployees();
    Integer deleteEmployee(String id);
    Employee selectById(String id);
    Integer updateEmployee(Employee employee);
}
