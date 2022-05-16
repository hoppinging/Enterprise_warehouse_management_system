<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/13
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>个人信息</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
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
            <a href="${pageContext.request.contextPath}/working">
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
    <div class="row clearfix">
        <div class="col-md-4 column" style="border-radius: 10px; background-color: cornflowerblue; color: white">
            <br>
            <br>
            <div style="margin: auto">
                <table class="table table-hover" style="border-radius: 10px; background-color: white; color: cornflowerblue">
                    <tr>
                        <td>id:</td>
                        <td>${sessionScope.get("user").id}</td>
                    </tr>
                    <tr>
                        <td>姓名:</td>
                        <td>${sessionScope.get("user").name}</td>
                    </tr>
                    <tr>
                        <td>权限:</td>
                        <td>${sessionScope.get("user").rbac?"管理员":"普通员工"}</td>
                    </tr>
                    <tr>
                        <td>密码:</td>
                        <td>${sessionScope.get("user").pwd}</td>
                    </tr>
                </table>
            </div>
            <br>
            <div style="width: 180px; margin: auto">
                <a href="${pageContext.request.contextPath}/toUpdateStaff/${sessionScope.get("user").id}">
                    <button class="btn btn-primary" style="width: 150px; background-color: cornflowerblue; margin-top: 20px">更新用户信息</button>
                </a>
            </div>
            <br>
            <br>
        </div>
    </div>
</div>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
