package com.chieh.service;

import com.chieh.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    boolean addUser(User user);
    Map findUser(int pageSize, int pageNo);
    Integer deleteUser(String[] ids);
    User findById(String id);
    boolean updateUser(User user);
    User login(String phone, String password);
}
