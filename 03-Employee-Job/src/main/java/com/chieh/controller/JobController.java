package com.chieh.controller;

import com.chieh.domain.Job;
import com.chieh.service.JobService;
import com.chieh.service.JobService;
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
@RequestMapping("/job")
public class JobController {

    @Resource
    private JobService jobService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addJob(Job job){
        Map<String,Object> map = new HashMap<>();
        if (job.getJremark() == "") { job.setJremark("无"); }
        if(jobService.addJob(job)){
            map.put("msg","添加职位成功");
        }else{
            map.put("msg","添加职位失败");
        }
        return map;
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map findJob(int pageSize,int pageNo){
        //map存放了一个List<Job>,以及总记录条数信息,
        return jobService.findJob(pageSize,pageNo);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteJob(HttpServletRequest request){
        //map存放了一个List<Job>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();

        String[] jobIds= request.getParameterValues("chkItems");
        if(jobService.deleteJob(jobIds) == jobIds.length){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/findByJid",method = RequestMethod.POST)
    @ResponseBody
    public Job findByJid(String jid){
        return jobService.findByJid(jid);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map updateJob(Job job){
        Map<String,Object> map = new HashMap<>();
        if (job.getJremark() == "") { job.setJremark("无"); }
        if(jobService.updateJob(job)){
            map.put("msg","更新职位信息成功");
        }else{
            map.put("msg","更新职位信息失败, 请先检查职位名字");
        }
        return map;
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Job> findAll(){
        //map存放了一个List<Job>,以及总记录条数信息,
        return jobService.findAll();
    }
}
