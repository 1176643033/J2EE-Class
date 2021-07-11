package com.chieh.controller;

import com.alibaba.fastjson.JSON;
import com.chieh.domain.Notice;
import com.chieh.domain.User;
import com.chieh.service.NoticeService;
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
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    @RequestMapping("/findTop5")
    @ResponseBody
    public Map findTop5(){
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",0);
        map.put("data",noticeService.findTop5Notices());
        return map;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map addNotice(String json, HttpSession session){
        Map<String,Object> map = new HashMap<>();
        //将json数据封装为Notice类对象
        Notice notice = JSON.parseObject(json,Notice.class);
        //从session中获取当前用户id赋值给notice

        //做完登录页后开启这部分代码,暂时全设置为100003

       /* User user = (User)session.getAttribute("user");
        if(user != null){
            notice.setUserId(user.getId());
            noticeService.addNotice(notice);
        }*/
       notice.setUserId("100003");
       map.put("msg",noticeService.addNotice(notice));

       return map;
    }

    @RequestMapping("find")
    @ResponseBody
    public Map findNotice(Integer page,Integer limit){
        Map<String,Object> map = new HashMap<>();

        Map<String,Object> mapService = noticeService.findNotice(page,limit);

        map.put("code",0);
        map.put("msg","");
        map.put("count",mapService.get("total"));
        map.put("data",mapService.get("list"));

        return map;
    }

    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    @ResponseBody
    public Map deleteUser(String id,HttpServletRequest request){
        //map存放了一个List<Dept>,以及总记录条数信息,
        Map<String,Object> map = new HashMap<>();
        Integer num  = noticeService.deleteNotice(id);
        if(num != null && num > 0){
            map.put("code",200);
        }else{
            map.put("code",500);
        }
        return map;
    }

}
