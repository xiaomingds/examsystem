<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/11/13
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 80px;
            padding-left: 50px;
            font-size: 20px;
        }
        .container { margin:10px ; min-width:10px;}
    </style>

    <<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>/js/index.js"></script>
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
            <a class="navbar-brand" style="font-size: 25px">C语言在线考试系统</a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li  ><a href=""><span class="glyphicon glyphicon-home"></span> 知识点 </a></li>
                <li  ><a href=""><span class="glyphicon glyphicon-home"></span> 题库 </a></li>
                <li><a href=""><span class="glyphicon glyphicon-briefcase"></span> 考试 </a></li>
                <li class = "dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user" ></span> 学生 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="" style="font-size: 20px">学生信息</a></li>
                        <li><a href="" style="font-size: 20px">学生成绩查询</a></li>
                        <!--<li class="divider"></li> -->
                        <!--<li><a href="#">另一个分离的链接</a></li>-->
                    </ul>
                </li>
            </ul>
            <div  style="margin: 10px ; text-align: right" class="info">
                <span style="color: gray">欢迎您：${sessionScope.teachersession.username}老师</span>
                <em>|</em>
                <a  href="">注销</a>
            </div>
        </div>
    </div><!-- /.container -->
</div>
学生信息页面
<div >
    <label > 学年：</label>
    <select id="semester">  <!--  下拉框  -->
    </select>
    &nbsp;        &nbsp;        &nbsp;
    <label >系别：</label>
    <select id="major">  <!--  下拉框  -->
        <option value="">系别</option>
    </select>
    &nbsp;        &nbsp;        &nbsp;
    <label > 班级：</label>
    <select id="class">  <!--  下拉框  -->
        <option value="">班级</option>
    </select>&nbsp;        &nbsp;        &nbsp;
    <button>确定</button>
    <button type="button" id="excelBtn">导入到Excel</button>
</div>
</body>
<script>
    $(function() {
        $.ajax({
            type: "POST",
            cache: false,
            url: "${APP_PATH}/login/basic/findall.do",
            data: {"pid": 0},
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#semester").append("<option value='" + data[i].seid + "'>" + data[i].sename + "</option>");
                }
            }
        });
        $("#semester").change(function(){
            var seid=$(this).val();
            $.ajax({
                type:"POST",
                cache:false,
                url:"${APP_PATH}/login/basic/findmaall.do",
                data:{"seid":seid},
                dataType:"json",
                success:function(data){
                    //追加本机option前，先清除city和county的option，以免重选时干扰
                    $("#major option").remove();
                    $("#class option").remove();
                    for (var i = 0; i < data.length; i++) {
                        $("#major").append("<option value='" + data[i].maid + "'>" + data[i].maname + "</option>");
                    }
                }
            });
        });
        $("#major").change(function(){
            var maid=$(this).val();
            console.log(maid);
            $.ajax({
                type:"POST",
                cache:false,
                url:"${APP_PATH}/login/basic/findciall.do",
                data:{"maid":maid},
                dataType:"json",
                success:function(data){
                    //追加本机option前，先清除city和county的option，以免重选时干扰
                    $("#class option").remove();
                    for (var i = 0; i < data.length; i++) {
                        $("#class").append("<option value='" + data[i].cid + "'>" + data[i].cname + "</option>");
                    }
                }
            });
        });
    });

</script>
</html>