<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/14
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>基础设置</title>

    <link rel="stylesheet" href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css">
    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <style>
        table {
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }

        table th {
            border: 1px solid black;
            width: 25%;
        }

        table td {
            align-items: center;
            border: 1px solid black;
            width: 25%;
        }

        table th {
            background-color: #c6d0e9;
        }
    </style>
    <script>
        //文档准备就绪
        $(function () {
            //设置 所有 td 居中
            $('table td').attr("align", "center");
            //标签+属性选择所有<编辑>按钮
            $('input[value="编辑"]').click(function () {
                //获取每一个<编辑>按钮的 下标（从0开始 所以需要+2 = 按钮在表格的所在行数）
                var numId = $('input[value="编辑"]').index($(this)) + 2;
                //选择表格中的所有tr 通过eq方法取得当前tr
                var ttr = $('table tr').eq(numId);
                /*当前行使用find方法找到每一个td列
                 each方法为每一个td设置function
                 */
                ttr.find("td").each(function () {
                    /*过滤 td中的元素
                     checkbox 、 button、text 不需要执行append
                     注意 return 为 跳出当前 each
                     return false 为 跳出整个 each
                     */
                    if ($(this).children("input[type='checkbox']").length > 0) {
                        return;
                    }
                    if ($(this).children("input[type='button']").length > 0) {
                        return;
                    }
                    if ($(this).children("input[type='text']").length > 0) {
                        return;
                    }
                    var tdText = $(this).html();
                    $(this).html("");
                    var inputObj = $("<input type='text'>");
                    inputObj.appendTo($(this));
                    inputObj.css("width", "95%");
                    inputObj.val(tdText);
                });
            });
            //为每一个确定按钮设置点击事件
            $('input[value="确定"]').click(function () {
                /*通过parents方法获取<确定>按钮的父容器tr
                 再为 tr中的每一个text设置function
                 */
                var ttr = $(this).parents("tr");
                ttr.find('input[type="text"]').each(function () {
                    var inputVal = $(this).val();
                    $(this).parents('td').html(inputVal);
                })
            });
            //全选/反选
            $('#cha').click(function () {
                //判断checkbox是否选中
                if ($(this).is(':checked')) {
                    $('input[type="checkbox"]').attr("checked", "true");
                } else {
                    $('input[type="checkbox"]').removeAttr("checked");
                }
            });
            //增加一行
            $('#add').click(function () {
                $('#tab1 tr').eq(2).clone(true).appendTo("#tab1");
            });

            //删除最后一行
            $('#delete').click(function () {
                $('table tr:last').remove();
            });
            //$('#deleteone').click(function () {
            //   $('input[type="checkbox"]');
            //});
            // $(function(){
            //    $("input[type='button']").click(function() {
            //       $("input[id=\"cha\"]:checked").each(function() { // 遍历选中的checkbox
            //           n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
            //            $("table#test_table").find("tr:eq("+n+")").remove();
            //        });
            //    });
            // });
        })

    </script>

    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">C语言在线考试系统</a>
        </div>
        <!-- /.navbar-header -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i>首页</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>题库<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/user/findallchoice.do">选择题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/blankall.do">填空题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/allReadFill.do">程序填空查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/allReadProgram.do">读程序写结果查询</a>
                            </li><li>
<a href="<%=basePath%>/tk/allPgDesign.do">程序设计查询</a>                        </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findpoint1.do"><i class="fa fa-table fa-fw"></i>知识点</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findallteacher.do"><i class="fa fa-edit fa-fw"></i>教师</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/teacher/allexam.do"><i class="fa fa-pencil fa-fw"></i>考试管理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/basic/allsemester.do"><i class="fa fa-wrench fa-fw"></i>基础设置</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <div class="container">
            <h1 class="text-center">教师信息页面</h1>
            <hr/>
            <div class="table-responsive">

                <table style="width: 90%" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="text-align: center;">教师姓名</th>
                        <th style="text-align: center;">密码</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.teachers}" var="ts">
                        <tr class="text-center">
                            <td>${ts.username}</td>
                            <td>${ts.password}</td>
                            <td>
                                <a href="#" onclick="return edit(${ts.id})" style="text-decoration: none;"
                                   id="teacheredit">
                                    <span class="fa fa-edit fa-fw"></span>
                                </a>
                                <a href="#" onclick="return trash(${ts.id})" style="text-decoration: none;"
                                   data-toggle="modal" data-target="#trashModal">
                                    <span class="fa fa-trash-o fa-fw"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div align="center">
                <button style="width: 60%" class="btn btn-outline btn-primary" id="teacheradd">新增</button>
            </div>
            <!-- 添加的模态框 -->
            <div class="modal fade" id="tchadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">老师添加</h4>
                        </div>
                        <form class="form-horizontal" action="<%=basePath%>/user/save.do" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" class="form-control" id="name"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="password" class="form-control" id="pwd"
                                               placeholder="数字或英语">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" id="emp_save_btn">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 删除的模态框 -->
            <div class="modal fade" id="trashModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模糊框头部 -->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">删除！</h4>
                        </div>
                        <!-- 模糊框主体 -->
                        <div class="modal-body">
                            <strong>你确定要删除吗？</strong>
                        </div>
                        <!-- 模糊框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 编辑的模态框 -->
            <div class="modal fade" id="tchedit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="Label">编辑</h4>
                        </div>
                        <form class="form-horizontal" action="<%=basePath%>/user/update.do" method="post">
                            <div class="modal-body">
                                <input name="id" id="id" hidden="hidden"/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" class="form-control" id="username"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="password" class="form-control" id="password"
                                               placeholder="数字或英语">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" id="tch_save_btn">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    /*<$(function(){
        window.location.href='user/findallteacher.do';
    })*/
    //点击新增按钮弹出模态框。
    $("#teacheradd").click(function () {
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        //reset_form("#empAddModal form");
        //s$("")[0].reset();
        //发送ajax请求，查出部门信息，显示在下拉列表中
        // getDepts("#empAddModal select");
        //弹出模态框
        $("#tchadd").modal({
            backdrop: "static"
        });
    });

    //删除
    function trash(id) {
        if (!id) {
            alert("error");
        } else {
            $(".delSure").click(function () {
                $.ajax({
                    url: '<%=basePath%>/user/delete.do?id=' + id,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
            });
        }
    }

    // 编辑信息的方法
    function edit(id) {
        if (!id) {
            alert("error");
        } else {
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/user/findById.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function (data) {
                    console.log("老师" + data);
                    $("#id").val(data.id);
                    $("#username").val(data.username);
                    $("#password").val(data.password);
                    $("#tchedit").modal('show');
                },
                error: function () {
                    alert("错误");
                }
            });
        }
    }
</script>

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>


</body>

</html>

