package com.chieh.service.impl;

import com.chieh.dao.UserDao;
import com.chieh.domain.User;
import com.chieh.service.UserService;
import com.sun.xml.internal.ws.developer.ValidationErrorHandler;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    //引用类型的自动注入@Autowired, @Resource
    @Resource
    private UserDao userDao;

    @Override
    public boolean addUser(User user) {
        //验证手机号是否存在
        if(userDao.selectByPhone(user.getPhone()) == null){
            if (userDao.insertUser(user) > 0){ return true; }
        }
        return false;
    }

    @Override
    public Map findUser(int pageSize, int pageNo) {
        Map<String,Object> map = new HashMap<>();
        int total = userDao.countUsers();
        map.put("total",total);
        map.put("list",userDao.queryUsers((pageNo-1)*pageSize,pageSize));
        return map;
    }

    @Override
    public User findById(String id) {
        return userDao.selectById(id);
    }

    @Override
    public boolean updateUser(User user) {
        Integer id = userDao.selectByPhone(user.getPhone());
        //该手机不存在或和本user相同才进行更新操作
        if ( id == null || id == Integer.parseInt(user.getId()) ){
            if(userDao.updateUser(user) > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public Integer deleteUser(String[] ids) {
        Integer count = 0;
        for (int i=0; i < ids.length; i++){
            count += userDao.deleteUser(ids[i]);
        }
        return count;
    }
}
