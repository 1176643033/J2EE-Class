<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/6/28
  Time: 12:31
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
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="iconfont/iconfont.css">
    <script type="text/javascript" src="js/jQuery3.5.js"></script>
    <script type="text/javascript" src="js/HRS.js"></script>
    
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .STYLE1 {font-size: 12px}
        .STYLE4 {
            font-size: 12px;
            color: #1F4A65;
            font-weight: bold;
        }

        a:link {
            font-size: 12px;
            color: #06482a;
            text-decoration: none;

        }
        a:visited {
            font-size: 12px;
            color: #06482a;
            text-decoration: none;
        }
        a:hover {
            font-size: 12px;
            color: #FF0000;
            text-decoration: underline;
        }
        a:active {
            font-size: 12px;
            color: #FF0000;
            text-decoration: none;
        }
        .STYLE7 {font-size: 12px}

        -->
    </style>

    <script type="text/javascript">
        $(function () {
            $("#employeeForm")[0].reset();
            loadDept();//加载部门数据
            loadJob();//加载职位数据

            $("#clear").click(function () {
                $("#employeeForm")[0].reset()
            })

            $("#save").click(function () {

                if(validateForm()){
                    $.ajax({
                        url  : "employee/add",
                        data : $("#employeeForm").serialize(),
                        dataType:"json",
                        success:function (data) {
                            $("#msg").text(data.msg);
                            if(data.msg == "添加员工成功"){
                                $("#employeeForm")[0].reset();//添加成功几时清除,以免重复提交    
                            }
                        }
                    })
                }
            })

        })


        //表单校验
        function validateForm(){
            var hrs = new HRS();
            var formItem1 = new FormItem("员工姓名","name");
            var formItem2 = new FormItem("身份证号","card_id");
            var formItem3 = new FormItem("手机号码","phone");
            var formItem4 = new FormItem("QQ号","qq_num");
            var formItem5 = new FormItem("邮箱","email");
            var formItem6 = new FormItem("民族","race");
            var formItem7 = new FormItem("生日日期","birthday");
            var formItem8 = new FormItem("专业","speciality");
            var formItem9 = new FormItem("邮政编号","post_code");
            var formItem10 = new FormItem("地址","race");
            var formItemArr = [formItem1, formItem2, formItem3, formItem4,formItem5,formItem6,
                                formItem7,formItem8,formItem9,formItem10]

            return (hrs.isNotEmpty(formItemArr));
        }

        //加载部门
        function loadDept() {
            $.ajax({
                url : "dept/findAll",
                dataType: "json",
                success : function (data) {
                    $.each(data, function (i,item) {
                        $("#dept_id").append("<option value = '"+item.did+"' >" + item.dname + "</option>")
                    })
                }
            })
        }

        //加载职位
        function loadJob() {
            $.ajax({
                url : "job/findAll",
                dataType: "json",
                success : function (data) {
                    $.each(data, function (i,item) {
                        $("#job_id").append("<option value = '"+item.jid+"' >" + item.jname + "</option>")
                    })
                }
            })
        }

    </script>
</head>

<body>
<form id="employeeForm">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
                <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">新增员工</span></td>
                <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
                </table></td>
                <td width="14"><img src="images/tab_07.gif" width="14" height="30" /></td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="9" background="images/tab_12.gif">&nbsp;</td>
                <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
                    <tr height="26"></tr>
                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">员工姓名</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="name" name="name" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">身份证号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="card_id" name="card_id" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">座机号码</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="tel" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;</div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">手机号码</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="phone" name="phone" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">QQ号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="qq_num" name="qq_num" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">邮箱</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="email" name="email" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">所属部门</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select id="dept_id" name="dept_id" style="width:105px; height:20px; border:solid 1px #035551; color:#000000"></select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">职位</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <select id="job_id" name="job_id" style="width:105px; height:20px; border:solid 1px #035551; color:#000000"></select>&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">性别</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select name="sex" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">政治面貌</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <select name="party" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                            <option value="共青团员">共青团员</option>
                            <option value="党员">党员</option>
                            <option value="群众">群众</option>
                        </select>&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">民族</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="race" name="race" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">生日日期</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="birthday" name="birthday" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">学历</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select name="education" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                            </select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">专业</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <input type="text" id="speciality" name="speciality" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">邮政编号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="post_code" name="post_code" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">地址</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" id="address" name="address" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">爱好</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><textarea name="hobby" style="width:300px; height:50px; border:solid 1px #035551; color:#000000"></textarea>&nbsp;</div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">备注</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><textarea name="remark" style="width:300px; height:50px; border:solid 1px #035551; color:#000000"></textarea>&nbsp;</div></td>
                    </tr>
                </table></td>
                <td width="9" background="images/tab_16.gif">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="9" background="images/tab_12.gif">&nbsp;</td>
                <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
                    <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="images/save.jpg" style="cursor:hand"  id="save"  />&nbsp;&nbsp;<img src="images/clear.jpg" style="cursor:hand"  id="clear"/>  &ensp;&ensp;&ensp;<font color="red" id="msg" style="padding-left: 40px;font-size: large"></font></td></tr>
                </table></td>
                <td width="9" background="images/tab_16.gif">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15" height="29"><img src="images/tab_20.gif" width="15" height="29" /></td>
                <td background="images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="75%" valign="top" class="STYLE1"><div align="left">
                            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="62" height="22" valign="middle"></td>
                                    <td width="50" height="22" valign="middle"></td>
                                </tr>
                            </table>
                        </div></td>
                    </tr>
                </table></td>
                <td width="14"><img src="images/tab_22.gif" width="14" height="29" /></td>
            </tr>
        </table></td>
    </tr>
</table>
</form>
</body>
</html>

