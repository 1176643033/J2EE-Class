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
                    <div>
                        <h2>学校简介</h2>
                        <hr>
                        五邑大学是由广东省人民政府于1985年设立的以工科为主的多科性大学，是广东省较早获得硕士、学士学位授予权的地方高校，具有接收港澳台侨学生、国际学生资格和推荐优秀应届本科毕业生免试攻读研究生资格，现为广东省高水平理工科大学建设高校、博士学位授予立项建设单位。

                        学校坚持践行“好学、多思、求实、创新”的校训，秉承“根植侨乡，服务社会，内外合力，特色发展”的办学理念，积极培养思想品德高尚、基础知识扎实，具有国际化视野、较强实践能力和创新创业能力，适应地方经济社会发展需求的高素质应用型人才。

                        学校位于粤港澳大湾区重要节点城市、“中国第一侨乡”——广东省江门市，校园占地面积1000余亩，总建筑面积近70万平方米。环境优美，基础设施齐全，办学条件良好。学校面向全国24个省区市及港澳台地区招收本科学生，面向国内外招收研究生。现有各类在籍学生近2.4万人，其中全日制本科生近2万人，研究生800余人。

                        学校设有19个教学机构，87个本科专业（方向），涉及工、理、经、管、文、法、艺术等7个学科门类，理工类专业（方向）占比67%。现有国家级一流本科专业建设点6个，国家级特色专业、国家级专业综合改革试点共5个；省级一流本科专业建设点9个，省级重点（名牌）专业、省级应用型人才培养示范专业等共39个。国家级大学生校外实践教育基地1个，省级大学生实践教学基地24个，省级示范性教师教育实践基地5个，省级实验教学示范中心14个。建有现代工业生产技术综合训练中心、生物科技与大健康学院实验中心、人工智能学习馆等一批实验实训基地。其中，“现代工业生产技术综合训练中心”是学校培养适应产业需求的现代技术创新型人才的重要基地，是融人才培养、科学研究、技术创新、企业服务、学生创新创业等功能于一体的示范性实训中心。学校人才培养质量得到社会广泛认可，本科生初次就业率多年位居全省公办本科高校前列。

                        学校现有10个省级重点学科，7个一级学科硕士学位授权点、3个二级学科硕士学位授权点以及5个专业硕士授权类别，硕士授权覆盖学校所有理工科专业。

                        学校现有专任教师1100余人。专任教师高级职称占比达40%，博士学位占比达51%；拥有国家级高层次人才31人（其中包括院士5人、长江学者5人、国家“杰青”4人、海外“杰青”1人、国家“优青”1人、国家“万人计划”入选者1人等），省级高层次人才22人，海外各类优秀人才67人。

                        学校拥有省重点实验室1个，省级新型研发机构1个、省级工程技术研究中心7个、省级人文社科研究基地2个、省级非物质文化遗产研究基地1个、省级文艺评论基地1个、省级区域产业知识产权分析评议中心1个、市厅级科研平台58个。学校着力在生物医药、新材料、智能制造等领域构建了“华南生物医药大动物模型研究院”“数字光芯片联合实验室”“江门市大健康国际创新研究院”“纺织新材料粤港联合实验室”“江门市海洋创新发展研究中心”等高水平创新平台，服务地方经济社会高质量发展。

                        学校大力开展对外交流合作，先后与美国、英国、德国、澳大利亚、日本、葡萄牙、香港、澳门等18个国家及地区共60多所高校及科研机构建立了合作关系，在学科建设、人才培养、学术研究、师资培训等方面开展了实质性合作。其中，与美国罗格斯大学、美国罗德岛大学、澳大利亚伍伦贡大学、加拿大英属哥伦比亚大学、英国利物浦大学、英国利物浦热带医学院、香港理工大学、澳门大学等13所高水平大学或科研机构共建国（境）外研究生联合培养基地，与“一带一路”沿线国家和地区开展短期研修项目。

                        新时代、新使命、新征程、新作为。五邑大学坚持以习近平新时代中国特色社会主义思想为指导，深入贯彻习近平总书记对广东重要讲话和重要指示批示精神，抢抓“双区”建设重大历史机遇，大力加强内涵建设，深入推动改革创新，不断促进高质量发展，为建设“应用型人才培养特色鲜明，服务地方产业发展能力突出”的高水平理工科大学而努力奋斗！
                    </div>
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

            layer.alert(JSON.stringify(data), {
                title: '当前行数据：'
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
