package com.chieh.utils;

import com.chieh.domain.UploadFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class GetFileUtil {
    /*
    * 函数名：getFile
    * 作用：使用递归，输出指定文件夹内的所有内容
    * 参数：path(文件夹路径)
    * */
    /**
     * 封装一个方法，来获取指定文佳佳下面的文件，并封装到对象中
     * @param path 要获取的文件夹
     * @return 返回一个集合
     */
     public static  List<UploadFile> getFile(String path){
         List<UploadFile> uploadfiles=new ArrayList<>();
         //获取指定文件对象
         File file= new File(path);
         /*获取路径文件夹中所有文件和文件夹*/
         File[] array=file.listFiles();
         for(int i=0;i<array.length;i++){
             if(array[i].isFile()){
                 //如果是文件则获取其文件名
                 //通过-截取文件名获得不同的信息如id，时间等
                 String[] spilt=array[i].getName().split("-");
                 try{
                     UploadFile uploadfile = new UploadFile();
                     /*将获取到时间转为long型然后再转为date型*/
                     String createtime=spilt[0];
                     System.out.println(createtime);
                     /*将信息封装到uploafile对象中*/
                     //20210707181938502845798
                     uploadfile.setUploadDate(createtime.substring(0,14));
                     uploadfile.setUserId(spilt[1]);
                     uploadfile.setFileName(array[i].getName());//完整的文件名
                     uploadfiles.add(uploadfile);
                 }catch (NumberFormatException e){
                     e.printStackTrace();
                 }
             }else{
                 //如果是文件夹则递归
                 getFile(array[i].getPath());
             }
         }
         return uploadfiles;
     }
}
