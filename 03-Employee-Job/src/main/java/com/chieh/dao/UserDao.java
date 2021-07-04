package com.chieh.dao;

import com.chieh.domain.Dept;
import com.chieh.domain.User;

import java.util.List;

public interface UserDao {
    Integer insertUser(User user);
    Integer selectByPhone(String phone);
    List<User> queryUsers(int index, int pageSize);
    Integer countUsers();
    Integer deleteUser(String id);
    User selectById(String id);
    Integer updateUser(User user);
}
