package com.chieh.controller;

import com.chieh.domain.UploadFile;
import com.chieh.service.FileService;
import com.chieh.utils.DateTimeUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/file")
public class FileController {

    @Resource
    private FileService fileService;
    //指定文件存放路径
    private String path = "C:\\J2EEForUpload";


    @RequestMapping("/upload")
    @ResponseBody
    public Map uploadFile( MultipartFile file){
        System.out.println("=====================上传接口调用============================");
        Map<String,Object> map = new HashMap<>();

        String userid = "100003";

        String fileName = file.getOriginalFilename();
        //将得到的文件保存到本地,可以用io流,一般用第三方插件
        //先判断是否文件夹存在,如果不存在则先创建文件夹
        File file1 = new File(path);
        if(!file1.exists()){
            //创建文件夹
            file1.mkdirs();
        }

        //文件名问题, 要解决文件重名问题
        String newFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+(new Random().nextInt(899999)+100000)+"-"+userid+"-"+fileName;
        if(file != null && !file.isEmpty()){
            //说明文件不为空
            try {
                file.transferTo(new File(path+"\\"+newFileName));
                //上传成功后将路径保存到数据库
                UploadFile uploadFile = new UploadFile();

                //暂时设置默认为100003
                uploadFile.setUserId(userid);

                uploadFile.setFileName(newFileName);
                uploadFile.setUploadDate(DateTimeUtil.getSysTime());
                if(fileService.uploadFile(uploadFile)){
                    map.put("code",200);
                }else {
                    map.put("code",500);
                }

            } catch (IOException e) {
                e.printStackTrace();
                map.put("code",500);
            }

        }
        //返回数据给前端
        map.put("msg","");
        map.put("data",newFileName);
        return map;
    }

    @RequestMapping("/selectDownload")
    @ResponseBody
    public Map selectDownload(){
        Map<String,Object> map = new HashMap<>();
        List<UploadFile> files = fileService.selectFiles();

        map.put("code",0);
        map.put("msg","");
        map.put("data",files);
        map.put("count",files.size());
        return map;
    }

    //处理下载时文件名含有中文出现中文乱码情况
    public String getFileName(HttpServletRequest request,String fileName)throws Exception{
        String[] IEBrowerKeyWord = {"MSIE","Trident","Edge"};
        String userAgent = request.getHeader("User-Agent");
        for(String KeyWord : IEBrowerKeyWord){
            if(userAgent.contains(KeyWord)){
                return URLEncoder.encode(fileName,"UTF-8");
            }
        }
        return new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
    }

    @RequestMapping("/download")
    @ResponseBody//ResponseEntity<byte[]>
    public ResponseEntity<byte[]> download(HttpServletRequest request,String fileName){
        System.out.println("============================"+fileName);
        File file = new File(path+"\\"+fileName);
        try {
            fileName = this.getFileName(request, fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment",fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK );
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
