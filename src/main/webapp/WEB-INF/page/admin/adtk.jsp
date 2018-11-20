<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/10/30
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>

<html  lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 80px;
            padding-left: 50px;
            font-size: 20px;
        }
        .container { margin:10px ; min-width:10px;}
    </style>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <style>
        table{
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }
        .container { margin:10px ; min-width:10px;}
        td{padding:0px 40px;}
        #customers{
            font-family:黑体;
            width:100%;
            border-collapse:collapse;
            text-align:center;
        }

        #customers td, #customers th{  /* 建立customers的派生选择器td，th*/
            font-size:1em;
            border:1px solid #35c628;
            padding:20px 7px 2px 7px;
        }

        #customers th{
            font-size:14px;
            text-align:center;
            padding-top:30px;
            padding-bottom:30px;
            background-color:#767c8d;
            color:#ffffff;
        }
        #customers tr.alt td{
            color:#000000;
            background-color:#EAF2D3;
        }
    </style>

</head>
<body>


<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"  style="font-size: 25px">C语言在线考试系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav"> <!-- 下列class="active"  为那个高亮 -->
                <li><a href="<%=basePath%>/user/findpoint1.do"><span class="glyphicon glyphicon-envelope"></span> 知识点 </a></li>
                <li  ><a href="<%=basePath%>/user/ListTk.do"><span class="glyphicon glyphicon-home"></span> 题库 </a></li>
                <li><a href=""><span class="glyphicon glyphicon-briefcase"></span> 考试 </a></li>
                <li><a href="<%=basePath%>/user/ListTeacher.do"><span class="glyphicon glyphicon-envelope"></span> 教师 </a></li>
                <li><a href=""><span class="glyphicon glyphicon-cog"></span> 基础设置 </a></li>
            </ul>
            <div  style="margin: 10px ; text-align: right" class="info">
                <span style="color: gray">欢迎您：${sessionScope.usersession.username } 老师</span>
                <em>|</em>
                <a  href="">退出</a>
            </div>
        </div>
    </div><!-- /.container -->
</div>  <!-- 抬头 -->

<div >
    <p>
    <p>
        管理员首页 &#8594; 题库
    </p>
    </p>
</div>   <!-- 当前位置 -->
</br>
</br>
</br>
<div class="col-lg-11">
    <table  id="customers" class="table table-bordered" border="1"style="width: 50%" align="center" >
        <thead>
        <tr>
        </tr>
        </thead>
        <tr>
            <th>题型</th>
            <th>数量</th>
        </tr>
        <tr>
            <td><a href="<%=basePath%>/user/toallchoice.do">选择题</a></td>
            <td  contenteditable="true">null</td>
        </tr>
        <tr>
            <td><a href=""> 填空题 </a></td>
            <td  contenteditable="true">100</td>
        </tr>
        <tr>
            <td><a href="<%=basePath%>/user/toallread.do"> 读程序写结果 </a></td>
            <td  contenteditable="true">80</td>
        </tr>
        <tr>
            <td><a href=""> 程序填空</a></td>
            <td  contenteditable="true">100</td>
        </tr>
        <tr>
            <td><a href=""> 程序设计题 </a></td>
            <td  contenteditable="true">120</td>
        </tr>
    </table>


</div>

</body>
</html