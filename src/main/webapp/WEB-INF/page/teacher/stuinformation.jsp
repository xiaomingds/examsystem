<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/12/18
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>教师首页</title>

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
                        <a href=""><i class="fa fa-table fa-fw"></i>考试<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="check_exam.html">查看考试信息</a>
                            </li>
                            <li>
                                <a href="exam.html">创建新考试</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="score_query.html"><i class="fa fa-bar-chart-o fa-fw"></i>学生<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="student_Information_import.html">学生信息导入</a>
                            </li>
                            <li>
                                <a href="score_query.html">学生成绩查询</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
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
        <h2>数据导入：</h2>
        <br>
        <div aria-orientation="horizontal">
            <label style="font-size: large" > 学年：</label>
            <select id="semester">  <!--  下拉框  -->
                <option>--学年选择--</option>
            </select>
            &nbsp;        &nbsp;        &nbsp;
            <label style="font-size: large">专业：</label>
            <select id="major">  <!--  下拉框  -->
                <option>--专业选择--</option>
            </select>
            &nbsp;        &nbsp;        &nbsp;
            <label style="font-size: large">班级：</label>
            <select id="class">  <!--  下拉框  -->
                <option>--班级选择--</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-outline btn-primary" onclick="search()" id="btn">确定</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <form style="margin:0px;display:inline;"  action="<%=basePath%>/student/ajaxUpload.do" method="post" enctype="multipart/form-data">
                <input style="display: inline" id="file" type="file" name="file"/>
                <input style="display: inline ; width: 5%" type="submit" name="submit" id="submit" value="上传" />
            </form>
        </div>
        <br>


        <!-- 信息上传 -->
        <div>
            <table class="table table-striped" style="width: 90%" align="center" id="test">
                <caption></caption>
                <thead>
                <tr>
                    <th id="num">学号</th>
                    <th>姓名</th>
                     <th>密码</th>
                     <th>操作</th>
                </tr>
                </thead>
                <tbody>


                </tbody>
            </table>
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
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>./vendor/dist/js/sb-admin-2.js"></script>

</body>
<script>
    function search(){
        $("#btn").click(function() {//清除table
            $("#test tbody").html("");
        });
        var options=$("#class option:selected");
        classname = options.text();
        $.ajax({
            type: "POST",
            cache: false,
            url: "${APP_PATH}/login/student/byclassname.do",
            data: {"classname": classname},
            dataType: "json",
            success: function (data) {
                var tempHtml = "";
                  for(var i = 0;i < data.length;i++){
                      id=data[i].id;
                      var destu = " <button  class=\"btn btn-outline btn-primary\"   id=\"id\"  onclick=\"return trash(id)\">删除</button>";
                      tempHtml += "<tr class=\"myclass\"><td>"+data[i].num+"</td><td>" + data[i].username+"</td><td>"+ data[i].password+ "</td><td>"+
                          destu +
                          ' <button class="btn btn-outline btn-primary" data-toggle="modal" data-target="#myModa_n" >修改</button>'+"</td></tr>";
                  }
                $("table").append(tempHtml);
            }
        });
    }
    // $("#deletestu").click(function(){
    //     console.log("开始响应");
    //     alert("开始响应");
    //     var num = $(this).parents("tr").find("#num").text();
    //     alert("当前班级" + num);
    //     // $("#addp1").modal({
    //     //     backdrop:"static"
    //     // });
    // });
    //删除
    function trash(id) {
        var  num = $("table td:eq(0)").text();
         alert(num);
                $.ajax({
                    url: '<%=basePath%>/student/detelestu.do? num=' + num,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
    }
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
