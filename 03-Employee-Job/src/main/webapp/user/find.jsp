<%--
  Created by IntelliJ IDEA.
  User: Chieh
  Date: 2021/6/27
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    int pageSize = 3;//每页显示多少条数据
%>

<html>
<head>
    <base href="<%=basePath%>"/>
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
            //默认展示第一页
            goPage(1);
            pageNavigation();
        })


        //数据行的复选框发生改变时的事件处理函数
        function chkClick() {
            var num = 0;    //记录chkItems选中数量

            //1.获取所有数据行复选框选中状态的数量, chkAll进行相应变化
            $( "input[name='chkItems']").each(function (index,element) {
                if (element.checked) num++;
            })
            //进行chkAll 选中或不选中
            $("input[name='chkAll']").prop("checked", num == $( "input[name='chkItems']").length ? true : false)

            //2.根据num来处理删改操作是否启用
            //0时更新按钮和编辑按钮失效
            if( 0 == num ) {
                //删除按钮失效
                $("#imgDel").prop("src","images/delete_disabled.jpg");
                $("#imgDel").removeAttr("style");
                //编辑按钮失效
                $("#imgUpdate").prop("src","images/update_disabled.jpg");
                $("#imgUpdate").removeAttr("style");
                $("#imgUpdate").removeAttr("onclick");
            }
            //复选框的选中数量 = 1,删除按钮，编辑按钮高亮
            if(num == 1) {
                $("#imgUpdate").prop("src","images/update.jpg");
                $("#imgUpdate").attr({"style":"cursor:pointer","onclick":"goUpdate()"});

                $("#imgDel").prop("src","images/delete.jpg");
                $("#imgDel").attr({"style":"cursor:pointer","onclick":"goDelete()"});
            }
            if(num > 1 ){
                //删除按钮有效
                $("#imgDel").prop("src","images/delete.jpg");
                $("#imgDel").attr("style","cursor:pointer");
                //更新按钮失效
                $("#imgUpdate").prop("src","images/update_disabled.jpg");
                $("#imgUpdate").removeAttr("style");
                $("#imgUpdate").removeAttr("onclick");
            }
        }

        //跳转到编辑更新页面
        function goUpdate() {
            $("#userForm").attr("action","user/update.jsp")
            $("#userForm").submit();
        }
        //删除操作
        function goDelete() {
            if(window.confirm("您确定要删除该用户信息吗？")){
                //记录页码数
                var pageno = $("#pageNo").text();
                //删除操作
                $.ajax({
                    url:"user/delete",
                    type:"post",
                    data:$("#userForm").serialize(),
                    success:function (data) {
                        alert(data.msg)
                    }
                })

                if($("input[name='chkItems']:checked").length == $("input[name='chkItems']").length){
                    goPage(pageno == 1? 1 : pageno-1);//否则返回上一页,因为本页数据已被删除完
                }else {
                    goPage(pageno);////如果删除的数据行数小于加载时的总量则返回到之前的页码数
                }
            }
        }

        //跳转页
        function goPage(pageNo) {

            //跳转指定页面时 没有这个参数pageNo, 所以判断成功后给pageNo赋值
            if(pageNo == undefined){
                //先验证$("input[name='textfield']").val()是否为非空且是整型数
                var hrs = new HRS();
                var formItem = new FormItem("页数","thatPage");
                if (hrs.isPageNo(formItem,$("#pageCount").text())){
                    pageNo = $("input[name='textfield']").val();
                }else{
                    //如果输入框的值不合法则打断函数
                    return
                }
            }
            //ajax异步获取页对象
            $.ajax({
                url  : "user/find?pageSize=<%=pageSize%>&pageNo="+ pageNo,
                cache:false,
                dataType:"json",
                success:function (data) {
                    $("#tableShow").empty();
                    //塞入表头
                    $("#tableShow").html('<tr>\n' +
                        '                            <td width="6%" height="26" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1"><input type="checkbox" name="chkAll" value="checkbox" /></div></td>\n' +
                        '                            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>\n' +
                        '                            <td width="15%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">用户姓名</div></td>\n' +
                        '                            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">用户角色</div></td>\n' +
                        '                            <td width="18%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">创建日期</div></td>\n' +
                        '                            <td width="18%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">手机号码</div></td>\n' +
                        '                            <td width="40%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">备注</div></td>\n' +
                        '                        </tr>')
                    //遍历用户列表塞入表格
                    $.each(data.list, function (i,item) {
                        $("#tableShow").append('<tr>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">\n' +
                            '                                <input name="chkItems" type="checkbox" class="STYLE2" value="'+item.id+'" />\n' +
                            '                            </div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">'+item.id+'</div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">'+item.username+'</div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">'+item.role_id+'</div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" >'+item.createdate+'</div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" >'+item.phone+'</div></td>\n' +
                            '                            <td height="18" bgcolor="#FFFFFF"><div align="center" >'+item.remark+'</div></td>\n' +
                            '                        </tr>')
                    })
                    $("#totalSize").text(data.total)
                    $("#pageCount").text(Math.ceil(data.total/<%=pageSize%>))
                    $("#pageNo").text(pageNo);
                    pageNavigation()

                    //给数据行的checkbox绑定事件
                    $("input[name='chkItems']").change(chkClick)

                    //给表头的复选框绑定事件
                    $("input[name='chkAll']").change(function () {
                        $("input[name='chkItems']").prop("checked", $(this).prop("checked"));
                        chkClick();//调用一遍这个函数以决定删改操作是否开启
                    })
                }
            })


        }

        //根据页数决定第一页,前一页,后一页,最后一页之类的展示
        function pageNavigation() {
            //不是第一页的情况 , 前一页和最前一页都可显示
            if (Number($("#pageNo").text()) > 1){
                //显示
                $("#firstPage").prop("src","images/firstPage.gif");
                $("#firstPage").attr({"style":"cursor:pointer","onclick":"goPage(1)"});
                $("#prevPage").prop("src","images/prevPage.gif");
                $("#prevPage").attr({"style":"cursor:pointer","onclick":"goPage("+($("#pageNo").text()-1)+")"});
            }else {
                //不可显示
                $("#firstPage").prop("src","images/firstPageDisabled.gif");
                $("#firstPage").removeAttr("style","onclick");
                $("#prevPage").prop("src","images/prevPageDisabled.gif");
                $("#prevPage").removeAttr("style","onclick");
            }
            //当不是最后一页时, 后一页和最后一页可展示
            if (Number($("#pageNo").text()) < Number($("#pageCount").text())){
                //显示
                $("#lastPage").prop("src","images/lastPage.gif");
                $("#lastPage").attr({"style":"cursor:pointer","onclick":"goPage("+$("#pageCount").text()+")"});
                $("#nextPage").prop("src","images/nextPage.gif");
                $("#nextPage").attr({"style":"cursor:pointer","onclick":"goPage("+(Number($("#pageNo").text())+1)+")"});
            }else {
                //不可显示
                $("#lastPage").prop("src","images/lastPageDisabled.gif");
                $("#lastPage").removeAttr("style onclick");
                $("#nextPage").prop("src","images/nextPageDisabled.gif");
                $("#nextPage").removeAttr("style onclick");
            }


        }

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
                    <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">系统用户列表</span></td>
                    <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="STYLE1"><div align="center"><img src="images/add.jpg" style="cursor:hand" onclick="document.location='dept/add.jsp'" id="imgAdd"/></div></td>
                                </tr>
                            </table></td>
                            <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="STYLE1"><div align="center"><img src="images/update_disabled.jpg" id="imgUpdate"/></div></td>
                                </tr>
                            </table></td>
                            <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="STYLE1"><div align="center"><img src="images/delete_disabled.jpg" id="imgDel"/></div></td>
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
                    <td bgcolor="#f3ffe3">

                        <!---在这加入一个表单是为了方便 删除或者更新操作时提交表单获取did值-->
                        <form id="userForm" >
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" id="tableShow" >


                        </table>
                        </form>
                    </td>
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
                            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共<label id="totalSize"></label>条纪录，当前第<label id="pageNo">1</label>/<label id="pageCount"></label>页，每页<%=pageSize%>条纪录</span></td>
                            <td width="75%" valign="top" class="STYLE1"><div align="right">
                                <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="30" height="22" valign="middle"><div align="right"><img src="images/firstPageDisabled.gif" id="firstPage" /></div></td>
                                        <td width="30" height="22" valign="middle"><div align="right"><img src="images/prevPageDisabled.gif" id="prevPage" /></div></td>
                                        <td width="30" height="22" valign="middle"><div align="right"><img src="images/nextPageDisabled.gif" id="nextPage" /></div></td>
                                        <td width="30" height="22" valign="middle"><div align="right"><img src="images/lastPageDisabled.gif" id="lastPage" /></div></td>
                                        <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                                        <td width="25" height="22" valign="middle"><span class="STYLE7">
                        <input name="textfield" type="text" class="STYLE1" style="height:14px; width:25px;text-align:right" size="5" id="thatPage" />
                      </span></td>
                                        <td width="23" height="22" valign="middle">页</td>
                                        <td width="30" height="22" valign="middle"><img onclick="goPage()" src="images/go.gif" width="37" height="15" /></td>
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
