package com.chieh.service;

import com.chieh.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    boolean addUser(User user);
    List<User> findUser(String searchphone,String searchname);
    Integer deleteUser(String[] ids);
    User findById(String id);
    boolean updateUser(User user);
    User login(String phone, String password);
}
