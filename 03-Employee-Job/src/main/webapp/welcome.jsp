<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/5
  Time: 16:21
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

    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"user/findcounts",
                dataType:"json",
                success:function (data) {
                    $("#userCount").text(data.userCount)
                    $("#employeeCount").text(data.employeeCount)
                    $("#deptCount").text(data.deptCount)
                    $("#jobCount").text(data.jobCount)
                    $("#noticeCount").text(data.noticeCount)
                    $("#fileCount").text(data.fileCount)
                }
            })
        })
    </script>
</head>
<body>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8" style="height: 500px">
            <div class="layui-card">
                <div class="layui-card-header"></div>
                <div class="layui-carousel" id="slideshow" lay-filter="slideshow">
                    <div carousel-item="">
                        <div><img src="images/hy1.jpg" alt="" style="width: 800px;height: 300px"></div>
                        <div><img src="images/hy2.jpg" alt="" style="width: 800px;height: 300px"></div>
                        <div><img src="images/hy3.png" alt="" style="width: 800px;height: 300px"></div>
                        <div><img src="images/hy4.jpg" alt="" style="width: 800px;height: 300px"></div>
                        <div><img src="images/hy5.png" alt="" style="width: 800px;height: 300px"></div>
                    </div>
                </div>
                <div>
                    <h2>狗屁不通生成器--银监会</h2>
                    <hr>
                    生活中，若证监会出现了，我们就不得不考虑它出现了的事实。 就我个人来说，证监会对我的意义，不能不说非常重大。 塞内加曾经提到过，勇气通往天堂，怯懦通往地狱。这不禁令我深思。 一般来说， 证监会因何而发生？ 一般来讲，我们都必须务必慎重的考虑考虑。 既然如此， 一般来说， 我们都知道，只要有意义，那么就必须慎重考虑。 美华纳曾经提到过，勿问成功的秘诀为何，且尽全力做你应该做的事吧。这似乎解答了我的疑惑。 证监会因何而发生？ 证监会，发生了会如何，不发生又会如何。 对我个人而言，证监会不仅仅是一个重大的事件，还可能会改变我的人生。 总结的来说， 可是，即使是这样，证监会的出现仍然代表了一定的意义。 我们不得不面对一个非常尴尬的事实，那就是， 我们不得不面对一个非常尴尬的事实，那就是， 别林斯基曾经说过，好的书籍是最贵重的珍宝。带着这句话，我们还要更加慎重的审视这个问题： 这样看来， 我们都知道，只要有意义，那么就必须慎重考虑。 我们都知道，只要有意义，那么就必须慎重考虑。 这样看来
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">综合统计</div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-danger" style="width: 100px;height: 70px">
                        用户数
                        <p style="font-size: 18px;" id="userCount">50</p>
                    </button>
                    <button class="layui-btn layui-btn-warm" style="width: 100px;height: 70px">
                        员工数
                        <p style="font-size: 18px;" id="employeeCount">50</p>
                    </button>
                    <button class="layui-btn layui-btn-normal" style="width: 100px;height: 70px">
                        部门数
                        <p style="font-size: 18px;" id="deptCount">10</p>
                    </button>
                </div>

                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-warm" style="width: 100px;height: 70px">
                        职位数
                        <p style="font-size: 18px;" id="jobCount">9</p>
                    </button>
                    <button class="layui-btn layui-btn-normal" style="width: 100px;height: 70px">
                        公告数
                        <p style="font-size: 18px;" id="noticeCount">21</p>
                    </button>
                    <button class="layui-btn layui-btn-danger" style="width: 100px;height: 70px">
                        文件数
                        <p style="font-size: 18px;" id="fileCount">13</p>
                    </button>
                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">快捷入口</div>
                <div class="layui-card-body">
                    <a class="layui-btn layui-btn-normal" style="width: 100px;height: 70px" href="https://www.baidu.com" target="_blank">
                        遇到
                    </a>
                    <a class="layui-btn layui-btn-danger" style="width: 100px;height: 70px" href="https://www.baidu.com" target="_blank">
                        BUG
                    </a>
                    <a class="layui-btn layui-btn-warm" style="width: 100px;height: 70px" href="https://www.baidu.com" target="_blank">
                        点这
                    </a>
                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">最新公告</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['carousel', 'form','table'], function(){
        var carousel = layui.carousel
            ,form = layui.form
            ,table = layui.table;

        table.render({
            elem: '#test'
            ,url:'notice/findTop5'
            ,cols: [[
                {field:'title', title:'标题', width:'40%'}
                ,{field:'content', title:'内容', width:'60%'}
            ]]
            ,page: true
        });

        //监听行单击事件（双击事件为：rowDouble）
        table.on('row(test)', function(obj){
            var data = obj.data;

            layer.alert("ID&nbsp;&nbsp;"+data.id+"<br>名称&nbsp;&nbsp;"+data.name+"<br>标题&nbsp;&nbsp;"+data.title+"<br>内容&nbsp;&nbsp;"+data.content+"<br>发布者&nbsp;&nbsp;"+data.userId,{
                title:'当前行数据'
            });

            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });

        //常规轮播
        carousel.render({
            elem: '#slideshow'
            ,arrow: 'always'
            ,width: '99%'
            ,height:'300px'
            ,interval:2500
            ,anim: 'fade'
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>

</html>
