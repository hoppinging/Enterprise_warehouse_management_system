<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hoppi.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/15
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新员工信息</title>
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
    int update = -1;
    try {
        update = (int) session.getAttribute("update");
    } catch (Exception ignored){}
    if (update == 1) {
%>
<script>
    alert("更新成功");
</script>
<%
    } else if (update == 0){
%>
<script>
    alert("更新失败");
</script>
<%
    }
    session.removeAttribute("update");
%>
<header style="background-color: cornflowerblue; color: white; height: 80px">
    <div class="container">
        <div id="headColumn" class="col-md-12 column" style="text-align: right">
            <c:if test="${userVariable.id == sessionScope.get('user').id}">
                <a href="${pageContext.request.contextPath}/account">
                    <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px">返回</button>
                </a>
            </c:if>
            <c:if test="${userVariable.id != sessionScope.get('user').id}">
                <a href="${pageContext.request.contextPath}/toStaffList">
                    <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px">返回</button>
                </a>
            </c:if>
            &nbsp;
            <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px" onclick="quit()">退出</button>
        </div>
    </div>
</header>
<br>
<br>
<div class="container">
    <div class="row clearfix col-md-4" style="margin: auto; color: white; border-radius: 10px; background-color: cornflowerblue">
        <form action="${pageContext.request.contextPath}/updateStaff" method="post">
            <br>
            <input type="hidden" name="id" value="${userVariable.id}">
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" name="name" id="name" value="${userVariable.name}" required style="color: cornflowerblue">
                <br>
                <br>
                <label for="pwd">密码</label>
                <input type="text" class="form-control" name="pwd" id="pwd" value="${userVariable.pwd}" required style="color: cornflowerblue">
                <br>
                <br>
                <label for="rbac">权限</label><br>
                <%
                    User userVariable = (User) session.getAttribute("userVariable");
                    if (userVariable.isRbac()) {
                %>
                <select style="color: cornflowerblue" name="rbac" id="rbac">
                    <option value=false>普通员工</option>
                    <option value=true selected>管理员</option>
                </select>
                <%
                    } else {
                %>
                <select style="color: cornflowerblue" name="rbac" id="rbac">
                    <option value=false selected>普通员工</option>
                    <option value=true>管理员</option>
                </select>
                <%
                    }
                %>
                <br>
            </div>
            <br>
            <br>
            <div class="form-group" style="margin: auto; width: 80px">
                <input type="submit" class="btn btn-primary" value="更新" style="background-color: cornflowerblue">
            </div>
            <br>
        </form>
    </div>
</div>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
