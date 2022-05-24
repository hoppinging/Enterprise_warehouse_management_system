<%@ page import="com.hoppi.pojo.User" %>
<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/15
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>添加员工</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script>
        function quit() {
            sessionStorage.clear();
            window.location.href="..";
        }
    </script>
</head>
<body>
<%
    com.hoppi.pojo.User user = (com.hoppi.pojo.User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/");
        return;
    }
%>
<header style="background-color: cornflowerblue; color: white; height: 80px">
    <div class="container">
        <div id="headColumn" class="col-md-12 column" style="text-align: right">
            <a href="${pageContext.request.contextPath}/toStaffList">
                <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px">返回</button>
            </a>
            &nbsp;
            <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px" onclick="quit()">退出</button>
        </div>
    </div>
</header>
<br>
<br>
<div class="container">
    <div class="row clearfix col-md-4" style="margin: auto; color: white; border-radius: 10px; background-color: cornflowerblue">
        <form action="${pageContext.request.contextPath}/addStaff" method="post">
            <br>
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" name="name" id="name" required style="color: cornflowerblue">
                <br>
                <br>
                <label for="pwd">密码</label>
                <input type="text" class="form-control" name="pwd" id="pwd" required style="color: cornflowerblue">
                <br>
                <br>
                <label for="rbac">权限</label><br>
                <select style="color: cornflowerblue" name="rbac" id="rbac">
                    <option value=false>普通员工</option>
                    <option value=true>管理员</option>
                </select>
                <br>
            </div>
            <br>
            <br>
            <div class="form-group" style="margin: auto; width: 80px">
                <input type="submit" class="btn btn-primary" value="新增" style="background-color: cornflowerblue">
            </div>
            <br>
        </form>
    </div>
</div>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
