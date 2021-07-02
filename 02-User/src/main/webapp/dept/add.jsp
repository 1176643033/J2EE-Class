<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/6/27
  Time: 17:41
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
            $("#deptForm")[0].reset()

            $("#clear").click(function () {
                $("#deptForm")[0].reset()
            })

            $("#save").click(function () {

                if(validateForm()){
                    $.ajax({
                        url  : "dept/add",
                        data : $("#deptForm").serialize(),
                        dataType:"json",
                        success:function (data) {
                            $("#msg").text(data.msg);
                            if(data.msg != "添加部门成功"){
                                $("#msg").text(data.msg+", 先检查部门名字是否重复再重新提交");
                            }
                            else{
                                $("#deptForm")[0].reset();
                            }
                        }
                    })
                }
            })

        })

       function validateForm(){
            var hrs = new HRS();
            var formItemArr = [new FormItem("部门名称","dname")];
            return hrs.isNotEmpty(formItemArr);
       }
    </script>

</head>

<body>
<form id="deptForm">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
                <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">新增部门</span></td>
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
                        <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">部门名称：</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1">
                            <div align="left" style="padding:2px" class="STYLE2"><input id="dname" type="text" name="dname" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;
                                <font color='red'>*</font>
                            </div>
                        </td>

                    </tr>

                    <tr>
                        <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">备注：</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1">
                            <div align="left" style="padding:2px" class="STYLE2">
                                <textarea id="dremark" name="dremark" style="width:300px; height:50px; border:solid 1px #035551; color:#000000"></textarea>
                                <font color="red" id="msg" style="padding-left: 40px;font-size: large"></font>
                            &nbsp;</div>
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
                    <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px">  <img src="images/save.jpg" style="cursor:hand" id="save" />&nbsp;<img src="images/clear.jpg" style="cursor:hand" id="clear" /></td></tr>
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

