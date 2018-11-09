<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/10/16
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@page import="cn.ds.pojo.Teacher"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
    <!--  -->
    <style>
        body {
            padding-top: 80px;
            padding-left: 50px;
            font-size: 20px;
        }
        .container { margin:10px ; min-width:10px;}
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
            <div   style="margin: 10px ; text-align:right"  class="info">
                <span style="color: gray">欢迎您：</span>
                <em>|</em>
                <a  href="">退出</a>
            </div>
        </div>
    </div><!-- /.container -->
</div>  <!-- 抬头 -->


<div >
    <p>
    <p>
        管理员首页 &#8594; 教师
    </p>
    </p>
</div><!-- 当前位置 -->
<div class="container">
    <h1 class="text-center">老师信息页面</h1>
    <hr/>
    <div class="table-responsive">
        <button class="btn btn-primary" id="teacheradd">新增</button>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th style="text-align: center;">老师编号</th>
                <th style="text-align: center;">老师姓名</th>
                <th style="text-align: center;">密码</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.teachers}" var="ts">
                <tr class="text-center">
                    <td>${ts.id}</td>
                    <td>${ts.username}</td>
                    <td>${ts.password}</td>
                    <td>
                        <a href="#" onclick="return edit(${ts.id})" style="text-decoration: none;" id="teacheredit">
                            <span class="fa fa-edit fa-fw" ></span>
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
    <!-- 员工添加的模态框 -->
    <div class="modal fade" id="tchadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">老师添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="<%=basePath%>/user/save.do" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="username" class="form-control" id="name" placeholder="">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="password" class="form-control" id="pwd" placeholder="数字或英语">
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Label">编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="<%=basePath%>/user/update.do" method="post">
                        <input name="id" id="id" hidden="hidden"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="username" class="form-control" id="username" placeholder="">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="password" class="form-control" id="password" placeholder="数字或英语">
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
</body>
<script src="<%=basePath%>/lib/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/lib/bootstrap.min.js"></script>
<script>
    /*<$(function(){
        window.location.href='user/findallteacher.do';
    })*/
    //点击新增按钮弹出模态框。
    $("#teacheradd").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
      //reset_form("#empAddModal form");
        //s$("")[0].reset();
        //发送ajax请求，查出部门信息，显示在下拉列表中
       // getDepts("#empAddModal select");
        //弹出模态框
        $("#tchadd").modal({
            backdrop:"static"
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
                    console.log("老师"+data);
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
</body>
</html>
