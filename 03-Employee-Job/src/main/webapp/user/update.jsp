<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/7/3
  Time: 16:42
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

            $("#userForm")[0].reset();
            $("#role_id").empty();
            loadRole();

            $("#clear").click(function () {
                $("#userForm")[0].reset()
            })

            //先从服务端更据传来的id获取用户信息
            $.ajax({
                url  : "user/findByDid",
                method:"post",
                data : {"id":"<%=request.getParameter("chkItems")%>"},
                dataType:"json",
                success:function (data) {
                    //塞入数据到表格
                    $("#username").val(data.username);
                    $("#phone").val(data.phone)
                    $("#role_id").val(String(data.role_id))
                    $("#remark").val(data.remark);
                }
            })

            $("#save").click(function () {

                if(validateForm()){
                    $.ajax({
                        url  : "user/update",
                        data : $("#userForm").serialize(),
                        dataType:"json",
                        success:function (data) {
                            $("#msg").text(data.msg);
                            if(data.msg == "更新用户信息成功"){
                                $("#userForm")[0].reset();//更新成功时清除,以免重复提交
                            }
                        }
                    })
                }
            })

        })

        function validateForm(){
            var hrs = new HRS();
            var formItem1 = new FormItem("用户姓名","username");
            var formItem2 = new FormItem("用户密码","password");
            var formItem3 = new FormItem("确认密码","checkpswd");
            var formItem4 = new FormItem("手机号码","phone");
            var formItemArr = [formItem1, formItem2, formItem3, formItem4]

            return (hrs.isNotEmpty(formItemArr) && hrs.isSame(formItem2,formItem3));
        }

        //加载角色函数
        function loadRole() {
            $.ajax({
                url : "role/findAll",
                dataType: "json",
                success : function (data) {
                    $.each(data, function (i,item) {
                        $("#role_id").append("<option value = '"+item.rid+"' >" + item.rname + "</option>")
                    })
                }
            })
        }
    </script>
    
</head>
<body>
<form id="userForm">
    <input type="text"  hidden name="id" value="<%=request.getParameter("chkItems")%>" readonly></input>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
                    <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">更新用户页面</span></td>
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
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户姓名</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="username" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" id="username">&nbsp;<font color='red'>*</font></div></td>
                        </tr>
                        <tr>
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户密码</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="password" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" id="password">&nbsp;<font color='red'>*</font></div></td>
                        </tr>
                        <tr>
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">确认密码</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="checkpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" id="checkpswd">&nbsp;<font color='red'>*</font></div></td>
                        </tr>
                        <tr>
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">手机号码</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="phone" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" id="phone">&nbsp;<font color='red'>*</font></div></td>
                        </tr>
                        <tr>
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">角色</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                                <select name="role_id" style="width:105px; height:20px; border:solid 1px #035551; color:#000000" id="role_id">
                                </select>&nbsp;<font color='red'>*</font></div></td>
                        </tr>
                        <tr>
                            <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">备注</div></td>
                            <td bgcolor="#FFFFFF" class="STYLE1">
                                <div align="left" style="padding:2px" class="STYLE2">
                                    <textarea name="remark" style="width:300px; height:50px; border:solid 1px #035551; color:#000000" id="remark"></textarea>&nbsp;
                                    <font color="red" id="msg" style="padding-left: 40px;font-size: large"></font>
                                </div>
                            </td>
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
                        <tr height="26">
                            <td bgcolor="#FFFFFF" height="20" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px">
                                <button  type="button" id="save" class="layui-btn layui-btn-radius" ><i class="layui-icon layui-icon-ok" style="font-size: 15px;">&ensp;保存</i></button>
                                &ensp;&ensp;<button  type="button" id="clear" class="layui-btn layui-btn-radius" ><i class="layui-icon layui-icon-fonts-clear" style="font-size: 15px;">&ensp;清除</i></button>
                                &ensp;<button type="button" class="layui-btn layui-btn-radius" onclick="document.location='user/find.jsp'" ><i class="layui-icon layui-icon-left" style="font-size: 15px;">&ensp;返回</i></button>
                            </td>
                        </tr>
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
