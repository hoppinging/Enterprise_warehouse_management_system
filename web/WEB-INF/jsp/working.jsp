<%@ page import="com.hoppi.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/10
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Work Station</title>
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
            <a href="${pageContext.request.contextPath}/account">
                <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px">账号</button>
            </a>
            &nbsp;
            <button class="btn btn-primary" style="width: 110px; background-color: cornflowerblue; margin-top: 20px" onclick="quit()">退出</button>
        </div>
    </div>
</header>
<%
    if (user.isRbac()) {
%>
<script>
    const html = "<a href=\"${pageContext.request.contextPath}/toStaffList\">" +
        "<button class=\"btn btn-primary\" style=\"width: 110px; background-color: cornflowerblue; margin-top: 20px\">员工信息</button>" +
        "</a>&nbsp;&nbsp;&nbsp;" +
        "<a href=\"${pageContext.request.contextPath}/toLogList\">" +
        "<button class=\"btn btn-primary\" style=\"width: 110px; background-color: cornflowerblue; margin-top: 20px\">查询台账</button>" +
        "</a>&nbsp;&nbsp;";
    const headColumn = document.getElementById("headColumn");
    headColumn.innerHTML = html+headColumn.innerHTML;
</script>
<%@include file="administrators.jsp"%>
<%
    } else {
%>
<%@include file="staff.jsp"%>
<%
    }
%>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
