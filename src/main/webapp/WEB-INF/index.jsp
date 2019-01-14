<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆界面</title>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index/normalize.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index/demo.css" />--%>
    <%--<!--必要样式-->--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index/component.css" />--%>
    <style>
        html {
            background-image: url(<%=basePath%>/images/demo-1-bg.jpg);
        }

        .wrapper {
            margin: 140px 0 140px auto;
            width: 884px;
        }
        .loginBox {
            background-color: #F0F4F6;
            /*上divcolor*/
            border: 1px solid #BfD6E1;
            border-radius: 5px;
            color: #444;
            font: 14px 'Microsoft YaHei', '微软雅黑';
            margin: 0 auto;
            width: 388px
        }
        .loginBox .loginBoxCenter {
            border-bottom: 1px solid #DDE0E8;
            padding: 24px;
        }

        .loginBox .loginBoxCenter p {
            margin-bottom: 10px
        }

        .loginBox .loginBoxButtons {
            /*background-color: #F0F4F6;*/
            /*下divcolor*/
            border-top: 0px solid #FFF;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            line-height: 28px;
            overflow: hidden;
            padding: 20px 24px;
            vertical-align: center;
            filter: alpha(Opacity=80);
            -moz-opacity: 0.5;
            opacity: 0.5;
        }

        .loginBox .loginInput {
            border: 1px solid #D2D9dC;
            border-radius: 2px;
            color: #444;
            font: 12px 'Microsoft YaHei', '微软雅黑';
            padding: 8px 14px;
            margin-bottom: 8px;
            width: 310px;
        }

        .loginBox .loginInput:FOCUS {
            border: 1px solid #B7D4EA;
            box-shadow: 0 0 8px #B7D4EA;
        }
        .loginBox .loginBtn {
            background-image: -moz-linear-gradient(to bottom, blue, #85CFEE);
            border: 1px solid #98CCE7;
            border-radius: 20px;
            box-shadow: inset rgba(255, 255, 255, 0.6) 0 1px 1px, rgba(0, 0, 0, 0.1) 0 1px 1px;
            color: #444;
            /*登录*/
            cursor: pointer;
            float: right;
            font: bold 13px Arial;
            padding: 10px 50px;
        }
        .loginBox .loginBtn:HOVER {
            background-image: -moz-linear-gradient(to top, blue, #85CFEE);
        }
        .loginBox a.forgetLink {
            color: #ABABAB;
            cursor: pointer;
            float: right;
            font: 11px/20px Arial;
            text-decoration: none;
            vertical-align: middle;
            /*忘记密码*/
        }
        .loginBox a.forgetLink:HOVER {
            color: #000000;
            text-decoration: none;
            /*忘记密码*/
        }
        .loginBox input#remember {
            vertical-align: middle;
        }
        .loginBox label[for="remember"] {
            font: 11px Arial;
        }
    </style>
    <script src="https://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <link href="../jquery.fancyspinbox.css" rel="stylesheet" type="text/css">
</head>
<body style="background-image: url(../images/demo-1-bg.jpg)">
<div class="wrapper">
    <form  method="post" id = "downloadDocId">
        <table>
            <div class="loginBox">
                <div class="loginBoxCenter">
                    <p><label for="username">用户名：</label></p>
                    <p><input type="text" id="username" name="username" class="loginInput" autofocus="autofocus" required="required" autocomplete="off" placeholder="请输入账号" value="" /></p>
                    <p id="msage" hidden color="red">用户名不存在</p>
                    <!-- required 规定必需在提交之前填写输入字段-->
                    <p><label for="password">密码：</label></p>
                    <p><input type="password" id="password" name="password" class="loginInput" required="required" placeholder="请输入密码" value="" /></p>

                    <label class="item item-radio">
                        <input type="radio" name="group" value="admin" checked="checked">
                        管理员
                    </label>
                    <label class="item item-radio">
                        <input type="radio" name="group" value="teacher" >
                        教师
                    </label>

                    <label class="item item-radio">
                        <input type="radio" name="group" value="student">
                        学生
                    </label>
                </div>
                <div class="loginBoxButtons">
                    <button class="loginBtn" onclick="login()" >登录</button>
                </div>
            </div>
        </table>
    </form>
</div>
</body>

<script>
    function login() {
        var r = document.getElementsByName('group');
        var password = document.getElementById("password").value;
        var username = document.getElementById("username").value;
        if(password == ""||username == "") {
            alert("请输入用户名或密码");
        }
        else {
            if (r[0].checked) {
                document.getElementById("downloadDocId").action = "<%=basePath%>/user/login.do";
                document.getElementById("downloadDocId").submit();
            }
            else if (r[1].checked) {
                document.getElementById("downloadDocId").action = "<%=basePath%>/teacher/login.do";
                document.getElementById("downloadDocId").submit();
            }
            else {
                document.getElementById("downloadDocId").action = "<%=basePath%>/student/login.do";
                document.getElementById("downloadDocId").submit();
            }
        }
    }
</script>
<script src="<%=basePath%>/js/index/TweenLite.min.js"></script>
<script src="<%=basePath%>/js/index/EasePack.min.js"></script>
<script src="<%=basePath%>/js/index/rAF.js"></script>
<script src="<%=basePath%>/js/index/demo-1.js"></script>
<script>
    $(function(){
        $("#username").keyup(function()
        {           var username=$(this).val();

            $.ajax({
                url: "<%=basePath%>/user/validate.do",
                type: "POST",
                data: {"username": username},
                success: function (result) {
                    if (result) {
                        $("#msage").hide();
                    } else {
                        $("#msage").show();
                    }
                }
            })
        })
    })
</script>
</html>