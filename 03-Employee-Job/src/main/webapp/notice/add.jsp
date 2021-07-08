<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/6
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>


<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>"/>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
</head>
<body style="padding: 10px 15px 0px 15px">
<form class="layui-form layui-form-pane" action="" >
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <select name="name" style="position:relative;   z-index:999;">
                <option value="公告">公告</option>
                <option value="通知">通知</option>
                <option value="消息">消息</option>
            </select>
        </div>

        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>

        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark" lay-verify="required" placeholder="选填" autocomplete="off" class="layui-input">
        </div>

        <button class="layui-btn" lay-submit="" lay-filter="demo1">跳转式提交</button>
    </div>

    <div style="position:relative;   z-index:100;"><textarea name="content" id="container" style="margin-top: 80px;"></textarea></div>
</form>
</body>
<script>
    var ue = UE.getEditor("container")
    layui.use(['form', 'jquery','layer'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        //监听提交
        form.on('submit(demo1)', function(data){
            /*layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })*/

            var json = {"json":JSON.stringify(data.field)}
            //$.ajaxSettings.async = false;设置Ajax同步
            $.post("notice/add",json,function (data) {
                if(Boolean(data.msg)){
                    layer.msg("添加成功",{icon:1})
                }else {
                    layer.msg("添加失败",{icon:5})
                }
            })
            return false;
        });
    });
</script>
</html>
