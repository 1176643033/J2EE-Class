package com.chieh.controller;

import com.chieh.domain.Role;
import com.chieh.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    //这是为了填充下拉框
    @RequestMapping("/findAll")
    @ResponseBody
    public List<Role> findAll(){
        return roleService.findAll();
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map addRole(Role role){
        System.out.println("============================================");
        Map<String,Object> map = new HashMap<>();
        if (role.getRremark() == "") { role.setRremark("无"); }
        if(roleService.addRole(role)){
            map.put("msg","添加角色成功");
        }else{
            map.put("msg","添加角色失败, 请先检查部门名字");
        }
        return map;
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map findRole(int pageSize,int pageNo){
        //map存放了一个List<Role>,以及总记录条数信息,
        return roleService.findRole(pageSize,pageNo);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteRole(HttpServletRequest request){
        //map存放了一个List<Role>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();

        String[] roleIds= request.getParameterValues("chkItems");
        if(roleService.deleteRole(roleIds) == roleIds.length){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/findByRid",method = RequestMethod.POST)
    @ResponseBody
    public Role findByRid(String rid){
        return roleService.findByRid(rid);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateRole(Role role){
        Map<String,Object> map = new HashMap<>();
        if (role.getRremark() == "") { role.setRremark("无"); }
        if(roleService.updateRole(role)){
            map.put("msg","更新角色信息成功");
        }else{
            map.put("msg","更新角色信息失败, 请先检查部门名字");
        }
        return map;
    }
    
}
