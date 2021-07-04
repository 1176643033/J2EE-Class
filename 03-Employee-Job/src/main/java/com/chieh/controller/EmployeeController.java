package com.chieh.controller;

import com.chieh.domain.Employee;
import com.chieh.service.EmployeeService;
import com.chieh.utils.DateTimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    //引用类型的自动注入@Autowired, @Resource
    @Resource
    private EmployeeService employeeService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addEmployee(Employee employee){
        Map<String,Object> map = new HashMap<>();
        System.out.println("Controller的add方法");
        System.out.println(employee.toString());

        if (employee.getRemark() == "") { employee.setRemark("无"); }
        employee.setCreate_date(DateTimeUtil.getSysTime());
        if (employeeService.addEmployee(employee)){
            map.put("msg","添加员工成功");
        }else {
            map.put("msg","添加员工失败");
        }
        return map;
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map findEmployee(int pageSize, int pageNo){
        //map存放了一个List<Employee>,以及总记录条数信息,
        return employeeService.findEmployee(pageSize,pageNo);
    }

    @RequestMapping(value = "/findByDid",method = RequestMethod.POST)
    @ResponseBody
    public Employee findByDid(String id){
        return employeeService.findById(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateDept(Employee employee){
        Map<String,Object> map = new HashMap<>();
        if (employee.getRemark() == "") { employee.setRemark("无"); }
        if(employeeService.updateEmployee(employee)){
            map.put("msg","更新员工信息成功");
        }else{
            map.put("msg","更新员工信息失败");
        }
        return map;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteEmployee(HttpServletRequest request){
        //map存放了一个List<Dept>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();

        String[] ids= request.getParameterValues("chkItems");
        if(employeeService.deleteEmployee(ids) == ids.length){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }
}
