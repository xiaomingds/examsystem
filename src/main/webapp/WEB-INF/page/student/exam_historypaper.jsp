<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2019/1/6
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:set var="path" value="<%=basePath %>"></c:set>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>考试</title>
    <!-- Bootstrap Core CSS -->
    <link href="${path}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${path}/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="${path}/vendor/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="${path}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
<div class="container" style="margin-top: 100px;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row">
                <div style="border-bottom: 2px dashed #CAE5E8; text-align: center;">
                    <h2>${examinfo.examname}</h2>
                    <p>
                        出题人：${examinfo.teacher}<u>
                    </u>
                        &emsp;
                        得分：<u>${allscore}</u>
                        &emsp;
                        考试时间：<u>${examinfo.examtime}分钟</u>
                    </p>
                </div>
                <ul>
                    <c:forEach items="${choice}" var="ch">
                    <li>
                        <div style="border-bottom: 2px solid #FFF;margin-left: 30px;">
                            <c:set var="index" value="${index+1}"/>
                            <h3>${index}:${ch.content}</h3>
                            <p>A、${ch.aoption}</p>
                            <p>B、${ch.boption}</p>
                            <p>C、${ch.coption}</p>
                            <p>D、${ch.doption}</p>
                            <p>选择答案:
                                <c:if test="${ch.answer== ch.myanswer}">
                                <span style="color:green"><b>${ch.myanswer}</b></span>
                                </c:if>
                                <c:if test="${ch.answer!= ch.myanswer}">
                                <span style="color:red">
                                    <b>${ch.myanswer}</b>
                                </span>
                                </c:if>
                                &emsp;
                                正确答案: <span style="color:#F1AF00;"><b>${ch.answer}</b></span>
                                &emsp;
                                </b>
                            </p>
                        </div>
                    </li>
                    </c:forEach>
                    <c:forEach items="${judge}" var="ch">
                        <li>
                            <div style="border-bottom: 2px solid #FFF;margin-left: 30px;">
                                <c:set var="index" value="${index+1}"/>
                                <h3>${index}:${ch.content}</h3>
                                <p>正确</p>
                                <p>错误</p>
                                <p>选择答案:
                                    <c:if test="${ch.answer== ch.myanswer}">
                                        <span style="color:green">
                                            <b><c:if test="${ch.answer == true}">正确</c:if>
                                            <c:if test="${ch.answer != true}">错误</c:if></b>
                                        </span>
                                    </c:if>
                                    <c:if test="${ch.answer!= ch.myanswer}">
                                <span style="color:red">
                                    <b><c:if test="${ch.myanswer == true}">正确</c:if>
                                            <c:if test="${ch.myanswer != true}">错误</c:if></b>
                                </span>
                                    </c:if>
                                    &emsp;
                                    正确答案: <span style="color:#F1AF00;"><b><c:if test="${ch.answer == true}">正确</c:if>
                                            <c:if test="${ch.answer != true}">错误</c:if></b></span>
                                    &emsp;
                                    </b>
                                </p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%--<div class="jumbotron">--%>
                    <%--<h1>暂无试题数据，请联系管理员!</h1>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="${path}/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${path}/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${path}/vendor/metisMenu/metisMenu.min.js"></script>
<script src="${path}/vendor/dist/js/sb-admin-2.js"></script>

</body>

</html>
