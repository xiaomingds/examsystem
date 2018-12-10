<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/10/31
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
                <span style="color: gray">欢迎您：${sessionScope.usersession.username }老师</span>
                <em>|</em>
                <a  href="">退出</a>
            </div>
        </div>
    </div><!-- /.container -->
</div>  <!-- 抬头 -->
<br/>
<br/>
<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/index.js"></script>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/style.css" media="screen" type="text/css" />
<div>
    <div><button class="btn btn-primary" id="add">新增</button>
    </div>
    <div>
<c:forEach items="${requestScope.choice}" var="ch">
    <br/>
    <br/>
    <form>
    <td>
        <a href="#" onclick="return edit(${ch.id})" style="text-decoration: none;">
            <span class="fa fa-edit fa-fw"></span>
        </a>
        <a href="#" onclick="return trash(${ch.id})" style="text-decoration: none;"
           data-toggle="modal" data-target="#trashModal">
            <span class="fa fa-trash-o fa-fw"></span>
        </a>
    </td>
    <fieldset id="fieldset1">
        <p>${ch.content}</p>
               A: ${ch.aoption}<br/>
               B: ${ch.boption}<br/>
               C: ${ch.coption}<br/>
               D: ${ch.doption}<br/>
               <h5> 答案：${ch.answer}</h5>
               <h5> 分析：${ch.analysis}</h5>
               <h5> 所属知识点：${ch.chaptertwo}</h5>
               <h5> 难度：${ch.difficulty}</h5>
    </fieldset>
    </form>
</c:forEach>
</div>
</div>

<!-- 添加的模态框 -->
<div class="modal fade" id="addch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="my">添加</h4>
            </div>
            <form class="form-horizontal" action="<%=basePath%>/user/addchoice.do" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目</label>

                            <textarea class="form-control" rows="3" name="content" id="content"></textarea>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">A:</label>
                        <div class="col-sm-10">
                            <input type="text" name="aoption" class="form-control" id="aoption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">B:</label>
                        <div class="col-sm-10">
                            <input type="text" name="boption" class="form-control" id="boption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">C:</label>
                        <div class="col-sm-10">
                            <input type="text" name="coption" class="form-control" id="coption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">D:</label>
                        <div class="col-sm-10">
                            <input type="text" name="doption" class="form-control" id="doption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">答案</label>
                        <div class="col-sm-5">
                            <select class="form-control" id="answer" name = "answer">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分析</label>
                        <div class="col-sm-10">
                            <input type="text" name="analysis" class="form-control" id="analysis" placeholder="tell me why?">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">知识点</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="chapter" name = "chapter">
                            </select>
                            <select class="form-control" id="chaptertwo" name = "chaptertwo"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">难度</label>
                        <div class="col-sm-5">
                            <select class="form-control" id="difficulty" name = "difficulty">
                            <option value="热血青铜">热血青铜</option>
                            <option value="不屈白银">不屈白银</option>
                            <option value="英勇黄金">英勇黄金</option>
                            <option value="超级王牌">超级王牌</option>
                            <option value="无敌战神">无敌战神</option></select>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id = "addbut">提交</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- 编辑的模态框 -->
<div class="modal fade" id="editch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myedit">编辑</h4>
            </div>
            <form class="form-horizontal" action="<%=basePath%>/user/updatech.do" method="post">
                <div class="modal-body">
                    <input name="id" id="id" hidden="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目</label>
                        <textarea class="form-control" rows="3" name="content" id="upcontent"></textarea>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">A:</label>
                        <div class="col-sm-10">
                            <input type="text" name="aoption" class="form-control" id="upaoption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">B:</label>
                        <div class="col-sm-10">
                            <input type="text" name="boption" class="form-control" id="upboption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">C:</label>
                        <div class="col-sm-10">
                            <input type="text" name="coption" class="form-control" id="upcoption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">D:</label>
                        <div class="col-sm-10">
                            <input type="text" name="doption" class="form-control" id="updoption" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">答案</label>
                        <div class="col-sm-5">
                            <select class="form-control" id="upanswer" name = "answer">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分析</label>
                        <div class="col-sm-10">
                            <input type="text" name="analysis" class="form-control" id="upanalysis" placeholder="tell me why?">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">知识点</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="upchapter" name = "chapter">
                            </select>
                            <select class="form-control" id="upchaptertwo" name = "chaptertwo"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">难度</label>
                        <div class="col-sm-5">
                            <select class="form-control" id="updifficulty" name = "difficulty">
                                <option value="热血青铜">热血青铜</option>
                                <option value="不屈白银">不屈白银</option>
                                <option value="英勇黄金">英勇黄金</option>
                                <option value="超级王牌">超级王牌</option>
                                <option value="无敌战神">无敌战神</option></select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id = "upaddbut">提交</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
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
</body>
<script>
    $("#add").click(function(){
       getpoint();
        $("#addch").modal({
        backdrop:"static"
        });
    });
   function getpoint() {
        $.ajax({
            url:"${APP_PATH}/login/user/pointall.do",
            type:"GET",
          success:function(data) {
                console.log(data);
                var chapter =$(document).find("#chapter");
              var chaptertwo =$(document).find("#chaptertwo");
              var upchapter =$(document).find("#upchapter");
              var upchaptertwo =$(document).find("#upchaptertwo");
                var  num= data.length;
             //   console.log("长度是"+num);
                var pp = new Array(num+1);
                for (var i = 0; i < data.length; i++) {
                    chapter.append("<option value='" + data[i].id + "'>" + data[i].pointname + "</option>");
                    upchapter.append("<option value='" + data[i].id + "'>" + data[i].pointname + "</option>");
                }
              for (var j = 0; j < data[0].point2.length; j++) {
                  chaptertwo.append("<option value='" + data[0].point2[j].pname + "'>" + data[0].point2[j].pname + "</option>");
                 upchaptertwo.append("<option value='" + data[0].point2[j].pname + "'>" + data[0].point2[j].pname + "</option>");

              }
              //select1绑定change事件
              $("#chapter").change(function () {
                     console.log("到这儿了");
                     var p = this.value;
                       console.log("第几个"+p);
                       p = p-1;
                       //删除原来的信息
                       $("#chaptertwo").empty();
                      // console.log("啦啦啦2"+data[p].point2);
                       //遍历p2的数组
                       for (var j = 0; j < data[p].point2.length; j++) {
                           chaptertwo.append("<option value='" + data[p].point2[j].pname+ "'>" + data[p].point2[j].pname+ "</option>");
                       }
                });
              $("#upchapter").change(function () {
                  console.log("到这儿了");
                  var p = this.value;
                  console.log("第几个"+p);
                  p = p-1;
                  //删除原来的信息
                  $("#upchaptertwo").empty();
                  // console.log("啦啦啦2"+data[p].point2);
                  //遍历p2的数组
                  for (var j = 0; j < data[p].point2.length; j++) {
                      // console.log("这里面有 ￥"+ data[p].point2[j].pname);
                      upchaptertwo.append("<option value='" + data[p].point2[j].pname+ "'>" + data[p].point2[j].pname+ "</option>");
                  }
              });
            }
        });
    }
    // 编辑信息的方法
    function edit(id) {
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/user/findBychId.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function (data) {
                    getpoint(),
                        $("#id").val(data.id);
                    $("#upcontent").val(data.content);
                    $("#upaoption").val(data.aoption);
                    $("#upboption").val(data.boption);
                    $("#upcoption").val(data.coption);
                    $("#updoption").val(data.doption);
                    $("#editch answer").val(data.answer);
                    $("#upanalysis").val(data.analysis);
                    $("#editch upchapter").val(data.chapter);
                    console.log(data.chapter);
                    $("#editch upchaptertwo").val(data.chaptertwo);
                    $("#editch updifficulty").val(data.difficulty);
                    $("#editch").modal('show');
                },
                error: function () {
                    alert("错误");
                }
            });
    }
    //删除
    function trash(id) {
        if (!id) {
            alert("error");
        } else {
            $(".delSure").click(function () {
                $.ajax({
                    url: '<%=basePath%>/user/deletech.do?id=' + id,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
            });
        }
    }
</script>
</html>
