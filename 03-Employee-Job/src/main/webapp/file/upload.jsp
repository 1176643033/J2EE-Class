<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/7
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>


<html>
<head>

    <base href="<%=basePath%>"/>
    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>点击或拖拽文件上传</legend>
    </fieldset>

    <div class="layui-upload-drag" id="test10">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
        <div class="layui-hide" id="uploadDemoView">
            <hr>
            <img src="" alt="上传成功后渲染" style="max-width: 250px">
        </div>
    </div>
</body>
<script>
    layui.use(['upload', 'element', 'layer','jquery'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;

        //拖拽上传
        upload.render({
            elem: '#test10'
            ,multiple:true//多文件上传
            ,accept:'file'//上传所有文件类型
            ,size:2097152 //设置上传文件大小 0不限制
            ,url: 'file/upload' //改成您自己的上传接口
            ,done: function(res){
                if(Number(res.code) == 200){
                    layer.msg('上传成功',{icon:1});
                }else{
                    layer.msg('上传失败',{icon:2});
                }
                console.log(res)
            }
        });

    });
</script>
</html>
