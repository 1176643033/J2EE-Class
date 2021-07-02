<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/6/28
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"/>
    <title>无标题文档</title>
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

<div style="height: 30px">

</div>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

    <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
                <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">角色列表</span></td>
                <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><img src="images/add.jpg" style="cursor:hand" onclick="document.location='userAdd.html'"/></div></td>
                            </tr>
                        </table></td>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><img src="images/update_disabled.jpg" style="cursor:hand" onclick="document.location='userUpdate.html'"/></div></td>
                            </tr>
                        </table></td>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><img src="images/delete_disabled.jpg" style="cursor:hand" onclick="javascript:void(0)"/></div></td>
                            </tr>
                        </table></td>
                    </tr>
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
                    <tr>
                        <td width="3%" height="26" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1"><input type="checkbox" name="checkbox62" value="checkbox" /></div></td>
                        <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">角色编号</div></td>
                        <td width="16%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">角色名称</div></td>
                        <td width="45%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">备注</div></td>
                    </tr>
                    <tr>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                            <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
                        </div></td>
                        <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">1</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">财务部</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">优秀部门</div></td>
                    </tr>
                    <tr>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                            <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
                        </div></td>
                        <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">2</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">公关部</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"></div></td>
                    </tr>
                    <tr>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                            <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
                        </div></td>
                        <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">3</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">行政部</div></td>
                        <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">123</div></td>
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
                        <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共3条纪录，当前第1/1页，每页3条纪录</span></td>
                        <td width="75%" valign="top" class="STYLE1"><div align="right">
                            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="images/firstPageDisabled.gif" /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="images/prevPageDisabled.gif"  /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="images/nextPageDisabled.gif" /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="images/lastPageDisabled.gif" /></div></td>
                                    <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                                    <td width="25" height="22" valign="middle"><span class="STYLE7">
                        <input name="textfield" type="text" class="STYLE1" style="height:14px; width:25px;text-align:right" size="5" />
                      </span></td>
                                    <td width="23" height="22" valign="middle">页</td>
                                    <td width="30" height="22" valign="middle"><img src="images/go.gif" width="37" height="15" /></td>
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



