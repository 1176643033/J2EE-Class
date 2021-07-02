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

    <script>
    </script>
</head>

<body>

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
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="name" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">身份证号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="card_id" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">座机号码</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="tel" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">手机号码</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="phone" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">QQ号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="qq_num" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">邮箱</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="email" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">所属部门</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select name="dept_id" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                                <option value=""></option>
                                <option>外汇管理局</option>
                                <option>银行</option>
                            </select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">职位</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <select name="job_id" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                            <option value=""></option>
                            <option>外汇管理局</option>
                            <option>银行</option>
                        </select>&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">性别</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select name="sex" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                                <option value=""></option>
                                <option>男</option>
                                <option>女</option>
                            </select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">政治面貌</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <select name="party" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                            <option value="">共青团员</option>
                            <option>党员</option>
                            <option>群众</option>
                        </select>&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">民族</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="race" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">生日日期</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="birthday" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">学历</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                            <select name="education" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                                <option value=""></option>
                                <option>本科</option>
                                <option>硕士</option>
                            </select>&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">专业</div></td>                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                        <select name="speciality" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                            <option value="">商务英语</option>
                            <option>信息安全</option>
                        </select>&nbsp;<font color='red'>*</font></div></td>
                    </tr>

                    <tr>
                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">邮政编号</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="post_code" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>

                        <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">地址</div></td>
                        <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="address" style="width:300px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red'>*</font></div></td>
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
                    <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="images/save.jpg" style="cursor:hand" onclick="document.location='user.html'" />&nbsp;&nbsp;<img src="images/clear.jpg" style="cursor:hand" /></td></tr>
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

</body>
</html>

