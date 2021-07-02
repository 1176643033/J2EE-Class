package com.chieh.controller;

import com.chieh.domain.Dept;
import com.chieh.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Resource
    private DeptService deptService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addDept(Dept dept){
        Map<String,Object> map = new HashMap<>();
        if (dept.getDremark() == "") { dept.setDremark("无"); }
        if(deptService.addDept(dept)){
            map.put("msg","添加部门成功");
        }else{
            map.put("msg","添加部门失败");
        }
        return map;
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map findDept(int pageSize,int pageNo){
        //map存放了一个List<Dept>,以及总记录条数信息,
        return deptService.findDept(pageSize,pageNo);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteDept(HttpServletRequest request){
        //map存放了一个List<Dept>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();
        System.out.println("删除操作");

        String[] deptIds= request.getParameterValues("chkItems");
        if(deptService.deleteDept(deptIds) == deptIds.length){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/findByDid",method = RequestMethod.POST)
    @ResponseBody
    public Dept findByDid(String did){
        return deptService.findByDid(did);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateDept(Dept dept){
        Map<String,Object> map = new HashMap<>();
        if (dept.getDremark() == "") { dept.setDremark("无"); }
        if(deptService.updateDept(dept)){
            map.put("msg","更新部门信息成功");
        }else{
            map.put("msg","更新部门信息失败, 请先检查部门名字");
        }
        return map;
    }
}
