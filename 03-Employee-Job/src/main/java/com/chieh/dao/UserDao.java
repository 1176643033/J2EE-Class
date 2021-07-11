package com.chieh.dao;

import com.chieh.domain.Dept;
import com.chieh.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    Integer insertUser(User user);
    User selectByPhone(String phone);
    List<User> queryUsers(@Param("searchphone")String searchphone,
                          @Param("searchname")String searchname);
    Integer countUsers();
    Integer deleteUser(String id);
    User selectById(String id);
    Integer updateUser(User user);
}
