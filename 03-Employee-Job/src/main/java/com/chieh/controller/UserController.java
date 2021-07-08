package com.chieh.controller;

import com.chieh.dao.CountsDao;
import com.chieh.domain.Counts;
import com.chieh.domain.User;
import com.chieh.service.UserService;
import com.chieh.utils.DateTimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    //引用类型的自动注入@Autowired, @Resource
    @Resource
    private UserService userService;
    @Resource
    private CountsDao countsDao;

    @RequestMapping("/add")
    @ResponseBody
    public Map addUser(User user){
        Map<String,Object> map = new HashMap<>();
        System.out.println("Controller的add方法");
        System.out.println(user.getRole_id());

        if (user.getRemark() == "") { user.setRemark("无"); }
        user.setCreatedate(DateTimeUtil.getSysTime());
        if (userService.addUser(user)){
            map.put("msg","添加用户成功");
        }else {
            map.put("msg","添加用户失败,请检查手机号");
        }
        return map;
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map findUser(int pageSize, int pageNo){
        //map存放了一个List<User>,以及总记录条数信息,
        return userService.findUser(pageSize,pageNo);
    }

    @RequestMapping(value = "/findByDid",method = RequestMethod.POST)
    @ResponseBody
    public User findByDid(String id){
        return userService.findById(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateDept(User user){
        Map<String,Object> map = new HashMap<>();
        if (user.getRemark() == "") { user.setRemark("无"); }
        if(userService.updateUser(user)){
            map.put("msg","更新用户信息成功");
        }else{
            map.put("msg","更新用户信息失败, 请先检查手机号码");
        }
        return map;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteUser(HttpServletRequest request){
        //map存放了一个List<Dept>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();

        String[] ids= request.getParameterValues("chkItems");
        if(userService.deleteUser(ids) == ids.length){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping("/findcounts")
    @ResponseBody
    public Counts findCounts(){
        return countsDao.selectCounts();
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String phone, String password, String code, HttpServletRequest request){
        HttpSession session = request.getSession();
        //1.先判断验证码是否匹配
        if(code != null && !"".equals(code)){
            if(code.equals((String)session.getAttribute("code"))){
                System.out.println("===============================验证码匹配完成");
                //验证码验证匹配
                //2.调用service层检验是否存在手机号且密码一致
                User user = userService.login(phone,password);
                if(user != null){
                    //塞入到session中
                    session.setAttribute("user",user);
                    return "main";
                }
                request.setAttribute("msg","手机号或密码错误");
                return "login";
            }
        }
        request.setAttribute("msg","验证码错误");
        return "login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "index";
    }

}
