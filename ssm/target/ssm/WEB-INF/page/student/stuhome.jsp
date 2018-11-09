<%--
  Created by IntelliJ IDEA.
  User: 小鸣ds
  Date: 2018/10/16
  Time: 14:37
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
<body>
<div class="layui-upload">
    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
    <button type="button" class="layui-btn" id="test9">开始上传</button>
</div>

<!--<<script type="text/javascript" src="../../layui/layui.js"></script>-->
<script type="text/javascript" src="<%=basePath%>/js/jquery-3.2.1.min.js" ></script>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        var url=path+'uploadExcel/ajaxUpload.do';

        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: url
            ,auto: false
            ,accept:"file"   //指定允许上传的文件类型
            //,multiple: true
            ,bindAction: '#test9'
            ,done: function(res){
                console.log("上传成功")
            }
        });
    });
</script>
</body>
</html>