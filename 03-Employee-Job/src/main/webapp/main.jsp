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
        
    </script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo " style="color: #ffffff">狗蛋公司人事管理</div>
        <!-- 头部区域（可配合layui 已有的水平导航）
        <ul class="layui-nav layui-layout-left">


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
            </li>
        </ul>-->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                    当前用户名
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人信息</a></dd>
                    <dd><a href="user/logout">退出系统</a></dd>
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
                    <a class="" href="javascript:;">&ensp;<i class="myicon iconNMStubiao- " style="font-size: 25px; color: cadetblue ;"></i>&ensp;&ensp;用户管理</a>
                    <dl class="layui-nav-child" value="user">
                        <dd>
                            <a href="javascript:;"
                               data-url="user/find.jsp"
                               data-id="findUser"
                               data-title="查询用户"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;用户查询
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="user/add.jsp"
                               data-id="addUser"
                               data-title="添加用户"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加用户
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx27 " style="font-size: 25px; color: cadetblue;"></i>&ensp;&ensp;部门管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="dept/find.jsp"
                               data-id="findDept"
                               data-title="查询部门"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;查询部门
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="dept/add.jsp"
                               data-id="addDept"
                               data-title="添加部门"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加部门
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx12 " style="font-size: 25px; color: cadetblue;"></i>&ensp;&ensp;职位管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="job/find.jsp"
                               data-id="findJob"
                               data-title="查询职位"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;查询职位
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="job/add.jsp"
                               data-id="addJob"
                               data-title="添加职位"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加职位
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">&ensp;<i class="myicon icondrxx63 " style="font-size: 25px; color: cadetblue;"></i>&ensp;&ensp;员工管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="employee/find.jsp"
                               data-id="findEmployee"
                               data-title="查询员工"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;查询员工
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="employee/add.jsp"
                               data-id="addEmployee"
                               data-title="添加员工"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加员工
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="myicon iconjiaoseguanli " style="font-size: 40px; color: cadetblue;"></i>&ensp;角色管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="role/find.jsp"
                               data-id="findRole"
                               data-title="查询角色"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;查询角色
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="role/add.jsp"
                               data-id="addRole"
                               data-title="添加角色"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加角色
                            </a>
                        </dd>
                    </dl>
                </li>
                <!---------------------------->

                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="myicon iconjiaoseguanli " style="font-size: 40px; color: cadetblue;"></i>&ensp;公告管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="notice/find.jsp"
                               data-id="findNotice"
                               data-title="查询公告"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;查询公告
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="notice/add.jsp"
                               data-id="addNotice"
                               data-title="添加公告"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;添加公告
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="myicon iconjiaoseguanli " style="font-size: 40px; color: cadetblue;"></i>&ensp;文件管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               data-url="file/download.jsp"
                               data-id="downloadFile"
                               data-title="下载文件"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconchaxun " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;下载文件
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:;"
                               data-url="file/upload.jsp"
                               data-id="uploadFile"
                               data-title="上传文件"
                               data-type="tabAdd"
                               class="site-demo-active">
                                <i class="myicon iconzengjiatianjiajiajian " style="font-size: 20px; color: cadetblue;"></i>
                                &ensp;上传文件
                            </a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this"><i class="layui-icon layui-icon-home" style="font-size: 20px; color: #009f95;"></i>&ensp;欢迎页面</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src="welcome.jsp" width="100%" height="500px"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer" align="center">
        <!-- 底部固定区域 -->
        版权所有©狗蛋公司 ———— 一个不存在的公司
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

        //触发事件
        var active = {
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:98%;height: 500px"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });

    });
</script>

</body>
</html>