<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/7
  Time: 22:58
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
    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="info">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'notice/find'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,title: '公告数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'title', title:'标题', width:120}
                ,{field:'name', title:'名称', width:80}
                ,{field:'content', title:'内容', width:350,height:40}
                ,{field:'userId', title:'发布人',width:80}
                ,{field:'remark', title:'备注', width:80}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    //构建json数据
                    var json = {"id":data.id};
                    //传递id值给后端
                    $.post("notice/deleteById",json,function (data) {
                        if(Number(data.code) == 200 ){
                            layer.msg("删除成功",{icon:1});
                        }else{
                            layer.msg("删除失败",{icon:5});
                        }
                    })
                    layer.close(index);
                });
            } else if(obj.event === 'info'){
                layer.alert("ID&nbsp;&nbsp;"+data.id+"<br>名称&nbsp;&nbsp;"+data.name+"<br>标题&nbsp;&nbsp;"+data.title+"<br>内容&nbsp;&nbsp;"+data.content+"<br>发布者&nbsp;&nbsp;"+data.userId,{
                    title:'当前行数据'
                });
            }
        });
    });
</script>

</body>
</html>

