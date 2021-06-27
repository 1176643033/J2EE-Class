<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta charset="UTF-8">
    <title>二狗人事管理系统</title>

    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="iconfont/iconfont.css">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <script type="text/javascript">
        $(function () {

            //绑定事件, 点击左侧导航栏时"main"跳转到相应的页面
            $("[class='leftItems']").click(function () {
                //点击左侧导航栏时"main"跳转到相应的页面
                window.frames["main"].location.href= $(this).attr("name");
            })


        })
    </script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs " style="color: #ffffff">狗蛋公司人事管理</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <!--暂时不用上分小窗
            <li class="layui-nav-item layui-hide-xs"><a href="">nav 1</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="">nav 2</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="">nav 3</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">nav groups</a>
                <dl class="layui-nav-child">
                    <dd><a href="">menu 11</a></dd>
                    <dd><a href="">menu 22</a></dd>
                    <dd><a href="">menu 33</a></dd>
                </dl>
            </li>-->
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                    当前用户名
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人信息</a></dd>
                    <dd><a href="">退出系统</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">&ensp;<i class="myicon iconNMStubiao- " style="font-size: 25px; color: #1E9FFF;"></i>&ensp;&ensp;用户管理</a>
                    <dl class="layui-nav-child" value="user">
                        <dd><div name="user/find.jsp" class="leftItems"><a href="javascript:;"><i class="myicon iconchaxun " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;用户查询</a></div></dd>
                        <dd><div name="user/add.jsp" class="leftItems"><a href="javascript:;"><i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;添加用户</a></div></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx27 " style="font-size: 25px; color: #1E9FFF;"></i>&ensp;&ensp;部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><div name="dept/find.jsp" class="leftItems"><a href="javascript:;"><i class="myicon iconchaxun " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;部门查询</a></div></dd>
                        <dd><div name="dept/add.jsp" class="leftItems"><a href="javascript:;"><i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;添加部门</a></div></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx12 " style="font-size: 25px; color: #1E9FFF;"></i>&ensp;&ensp;职位管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"><i class="myicon iconchaxun " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;职位查询</a></dd>
                        <dd><a href="javascript:;"><i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;添加职位</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx63 " style="font-size: 25px; color: #1E9FFF;"></i>&ensp;&ensp;员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"><i class="myicon iconchaxun " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;员工查询</a></dd>
                        <dd><a href="javascript:;"><i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;添加员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="myicon iconjiaoseguanli " style="font-size: 40px; color: #1E9FFF;"></i>&ensp;角色管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"><i class="myicon iconchaxun " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;角色查询</a></dd>
                        <dd><a href="javascript:;"><i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: #1E9FFF;"></i>&ensp;添加角色</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;">click menu item</a></li>
                <li class="layui-nav-item"><a href="">the links</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px"><iframe name="main" src="user/find.jsp" style="height: 100%;width: 100%" frameborder="0"  scrolling="no"></iframe></div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>

<!--一些列表点击之类的事件-->
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });
</script>

</body>
</html>