<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/9
  Time: 12:25
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

    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="iconfont/iconfont.css">
    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script type="text/javascript" src="js/HRS.js"></script>

</head>
<body>

<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item"style="margin-top: 10px">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="id"  lay-verify="required" value="${user.id}" autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${user.username}" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" name="password" lay-verify="required" value="${user.password}" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input type="tel" name="phone" lay-verify="required|phone" value="${user.phone}" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">职位</label>
        <div class="layui-input-inline">
            <input type="text" name="role" autocomplete="off" value="${user.role_id}" class="layui-input" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">注册日期</label>
        <div class="layui-input-inline">
            <input type="text" name="createdate" autocomplete="off" value="${user.createdate}" class="layui-input" disabled="disabled">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark" autocomplete="off" value="${user.remark}" class="layui-input">
        </div>
    </div>

</form>
</body>

<script>
    layui.use(['form', 'layedit'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;



        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            return false;
        });


        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>

</html>