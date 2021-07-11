package com.chieh.service.impl;

import com.chieh.dao.UserDao;
import com.chieh.domain.User;
import com.chieh.service.UserService;
import com.sun.xml.internal.ws.developer.ValidationErrorHandler;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import java.util.HashMap;
import java.util.List;
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
    public List<User> findUser(String searchphone, String searchname) {
        Map<String,Object> map = new HashMap<>();
        String phone = "%"+searchphone+"%";
        String name = "%"+searchname+"%";
        return userDao.queryUsers(phone,name);
    }

    @Override
    public User findById(String id) {
        return userDao.selectById(id);
    }

    @Override
    public boolean updateUser(User user) {
        User user1 = userDao.selectByPhone(user.getPhone());
        //该手机不存在或和本user相同才进行更新操作
        if ( user1 == null || user1.getId().equals(user.getId())){
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


    @Override
    public User login(String phone, String password) {
        //1.先查出改手机号用户
        User user = userDao.selectByPhone(phone);
        System.out.println("------------------Service层获取到的user对象"+user);
        //2.调用拿到该手机号用户对象与controller层传来的password对比
        if (user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }
}
