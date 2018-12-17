
<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/17
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%><!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>考试设置</title>
    <link rel="stylesheet" href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css">
    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <style>
        table{
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }
        table th {
            border: 1px solid black;
            width: 10%;
        }
        table td {
            align-items: center;
            border: 1px solid black;
            width: 10%;
        }

        table th {
            background-color: #c6d0e9;
        }
    </style>


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
                    <li><a href="../login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="Choice%20question_query.html">选择题查询</a>
                            </li>
                            <li>
                                <a href="Completion%20question_query.html">填空题查询</a>
                            </li>
                            <li>
                                <a href="Fill_in_blanks%20question_query.html">程序填空查询</a>
                            </li>
                            <li>
                                <a href="Read_program_results%20question_query.html">读程序写结果查询</a>
                            </li><li>
                            <a href="Program_design%20question_query.html">程序设计查询</a>
                        </li>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="../../Knowledge_points/Knowledge_points.html"><i class="fa fa-table fa-fw"></i>知识点</a>
                    </li>
                    <li>
                        <a href="teacher.html"><i class="fa fa-edit fa-fw"></i>教师</a>
                    </li>
                    <li>
                        <a href="exam.html"><i class="fa fa-pencil fa-fw"></i>考试管理</a>
                    </li>
                    <li>
                        <a href="base_year.html"><i class="fa fa-wrench fa-fw"></i>基础设置</a>
                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
    <div id="page-wrapper">
        <br>
        <br>
        <table border="1" class="table table-bordered" id = "tab1">
            <thead>
            <tr>
                <th colspan="9">考试基础信息设置</th>
            </tr>
            </thead>

            <tr>
                <th>考试名称</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>类型</th>
                <th>密码</th>
                <th>状态</th>
                <th>命题人</th>
                <th>设置</th>
            </tr>
            <c:forEach items="${examInfo}" var="ex">
                <tr>
                    <td><a href="exam_score.html">${ex.examname}</a></td>
                    <td>${ex.begindate}-${ex.begintime}</td>
                    <td>${ex.enddate}-${ex.endtime}</td>
                    <c:choose>
                        <c:when test="${empty ex.password}">
                            <td>公开</td>
                        </c:when>
                        <c:otherwise>
                            <td>私有</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty ex.password}">
                            <td>公开</td>
                        </c:when>
                        <c:otherwise>
                            <td>${ex.password}</td>
                        </c:otherwise>
                    </c:choose>
                    <% request.setAttribute("currentTime", new Date()); %>
                    <c:choose>
                        <c:when test="${ex.enddate < currentTime}">
                            <td>已结束</td>
                        </c:when>
                        <c:otherwise>
                            <td>未开始</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${ex.teacher}</td>
                    <td >
                        <input  class="btn btn-outline btn-primary" type="button" value="删除" onclick="$(':checkbox:checked').closest('tr').remove()">
                        <input  class="btn btn-outline btn-primary" type="button" value="更改" onclick="edit('${ex.id}')">
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>

        <!-- /#page-wrapper -->
    </div>
    <!-- 更改模态框  data-toggle="modal" data-target="#myModa_n" -->
    <div class="modal fade" id="editexam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="<%=basePath%>/teacher/upexam.do" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">考试信息更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">
                    <input name="id" id="id" hidden="hidden"/>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试名称：</span>
                        <input type="text" style="height: 40px" class="form-control" id="upexamname" name="examname">
                    </div>
                    <div class="form-group has-success" >
                        <label  >请选择更改后的考试开始时间:</label>
                        <div >
                            <input style="width: 45%" type="date" id="upbegintimedate"value="2015-09-24"/>
                            <input style="width: 45%" type="time" id="upbegintime"value="13:00:59"/>
                        </div>

                        <label >请选择更改后的考试结束时间:</label>
                        <div>
                            <input style="width: 45%" type="date" id="upendtimedate" value="2015-09-24"/>
                            <input style="width: 45%" type="time" id="upendtime" value="13:00:59"/>
                        </div>
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试密码：</span>
                        <input type="text" style="height: 40px" class="form-control" id="uppassword" name="password">
                    </div>
                    <div class="form-group">
                        <label>请选择考试命题人</label>
                        <select class="form-control" id="upteacher" name="teacher">
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                    <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                </div>
            </div>
            </form>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 添加模态框  data-toggle="modal" data-target="#myModa_n" -->
    <div class="modal fade" id="addexam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="">考试信息更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试名称：</span>
                        <input type="text" style="height: 40px" class="form-control" id="examname" name="examname">
                    </div>

                    <div class="form-group has-success" >
                        <label  >请选择更改后的考试开始时间:</label>
                        <div >
                            <input style="width: 45%" type="date" id="begindate" name="begindate" value="2018-12-24"/>
                            <input style="width: 45%" type="time" id="begintime" name="begintime" value="13:00:59"/>
                        </div>

                        <label >请选择更改后的考试结束时间:</label>
                        <div>
                            <input style="width: 45%" type="date" id="enddate" name="enddate" value="2018-09-24"/>
                            <input style="width: 45%" type="time" id="endtime" name="endtime" value="14:00:59"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>请选择考试类型</label>
                        <select class="form-control" id="state" name="state">
                            <option value="1">private</option>
                            <option value="0">public</option>
                        </select>
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试密码：</span>
                        <input type="text" style="height: 40px" class="form-control" id="password" name="password">
                    </div>
                    <div class="form-group">
                        <label>请选择考试命题人</label>
                        <select class="form-control" id="teacher" name="teacher">
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                    <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>

</div>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>
</body>
<script>
    function edit(id) {
        console.log("id" + id);
        // 先去查询数据
        $.ajax({
            url: '<%=basePath%>/teacher/byexamid.do',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify({
                id: id
            }),
            success: function (data) {
                 getteacher();
                 console.log("数据" + data.examname);
                $("#id").val(data.id);
                $("#upexamname").val(data.examname);
                $("#uppassword").val(data.password);
                $("#begindate").val(data.begindate);
                $("#begintime").val(data.begintime);
                $("#enddate").val(data.enddate);
                $("#endtime").val(data.enddate);
                $("#endtime").val(data.enddate);
                $("#state").val(data.state);
                $("#editexam").modal('show');
            },
            error: function () {
                alert("错误");
            }
        });
        $("#editexam").modal('show');
    }
    function getteacher() {
        console.log("请求老师");
        $.ajax({
            url: "<%=basePath%>/user/listteacher.do",
            type: "GET",
            success: function (data) {
                var upteacher = $(document).find("#upteacher");
                for (var i = 0; i < data.length; i++) {
                    console.log("老师"  + data[i].username);
                    upteacher.append("<option value='" + data[i].username + "'>" + data[i].username + "</option>");
                }

            }
            });
    }
</script>
</html>