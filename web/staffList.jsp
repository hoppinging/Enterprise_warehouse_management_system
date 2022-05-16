<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/15
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script>
        function quit() {
            sessionStorage.clear();
            window.location.href="${pageContext.request.contextPath}/";
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
<script src="js/alert.js"></script>
<%
    int delete = -1;
    try {
        delete = (int) session.getAttribute("delete");
    } catch (Exception ignored){}
    if (delete == 1) {
%>
<script>
    alert("删除成功");
</script>
<%
        session.removeAttribute("delete");
    } else if (delete == 0){
%>
<script>
    alert("删除失败");
</script>
<%
        session.removeAttribute("delete");
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
        <div class="row col-md-11 column" style="margin: auto">
            <div class="col-md-2 column" style="display: inline">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddStaff" style="width: 100px; background-color: cornflowerblue">添加员工</a>
            </div>
            <div class="col-md-8"></div>
            <div class="col-md-1 column" style="display: inline">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/toStaffList" style="width: 100px; background-color: cornflowerblue">刷新</a>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-11 column" style="margin: auto">
            <table class="table table-hover table-striped">
                <thead>
                <tr class="col-md-12">
                    <th class="col-md-2">员工ID</th>
                    <th class="col-md-2">员工姓名</th>
                    <th class="col-md-2">员工权限</th>
                    <th class="col-md-4">员工密码</th>
                    <th class="col-md-2">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <c:if test="${user.id != sessionScope.get('user').id}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.rbac?"管理员":"普通员工"}</td>
                            <td>${user.pwd}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/toUpdateStaff/${user.id}" class="btn bg-light">修改</a>
                                &nbsp;|&nbsp;
                                <a href="${pageContext.request.contextPath}/deleteStaff/${user.id}" class="btn bg-light">删除</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
