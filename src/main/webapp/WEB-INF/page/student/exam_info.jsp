<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/20
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
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

    <title>考试</title>

    <style>
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
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
                        <a href="Special_practice.html"><i class="fa fa-bar-chart-o fa-fw"></i>专项练习</a>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="mock_exam.html"><i class="fa fa-table fa-fw"></i>模拟考试</a>
                    </li>
                    <li>
                        <a href="exam_password.html"><i class="fa fa-gear fa-fw"></i>考试</a>
                    </li>
                    <li>
                        <a href="wrong_problem.html"><i class="fa fa-edit fa-fw"></i>错题集</a>
                    </li>
                    <li>
                        <a href="score_query.html"><i class="fa fa-wrench fa-fw"></i>成绩查询</a>

                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <table class="table table-striped" style="width: 90% " align="center">
            <caption></caption>
            <thead>
            <tr>
                <th width="30%">考试名称</th>
                <th width="15%">开始时间</th>
                <th width="15%">结束时间</th>
                <th width="10%">类型</th>
                <th width="10%">状态</th>
                <th width="10%">命题人</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${examInfo}" var="ex">
                <tr>
                    <td><a onclick="disp_prompt()">${ex.examname}</a></td>
                    <td>${ex.begindate}&nbsp;${ex.begintime}</td>
                    <td>${ex.enddate}&nbsp;${ex.endtime}</td>
                    <c:choose>
                        <c:when test="${empty ex.password}">
                            <td>公开</td>
                        </c:when>
                        <c:otherwise>
                            <td>私有</td>
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
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- /#page-wrapper -->

</div>


<script>
    function disp_prompt()
    {
        var name=prompt("请输入密码",""); // 弹出input框
        if (name != "XXXX")
        {
            alert("密码正确");
            window.location.href="exam.html";
        }
        else
        {
            alert("密码错误");
        }
    }
</script>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>
</body>
</html>
