package com.chieh.controller;

import com.chieh.domain.User;
import com.chieh.service.UserService;
import com.chieh.utils.DateTimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    //引用类型的自动注入@Autowired, @Resource
    @Resource
    private UserService userService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addUser(User user){
        Map<String,Object> map = new HashMap<>();
        System.out.println("Controller的add方法");

        //暂时默认设置role_id=1
        user.setRole_id("1");

        user.setCreatedate(DateTimeUtil.getSysTime());
        if (userService.addUser(user)){
            map.put("msg","添加用户成功");
        }else {
            map.put("msg","添加用户失败");
        }

        return map;
    }
}
