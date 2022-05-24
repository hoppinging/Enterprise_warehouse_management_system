<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/15
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>台账管理</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${ctx}/jeDate/skin/jedate.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/jeDate/test/jeDate-test.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/jeDate/src/jedate.js"></script>
    <script>
        function quit() {
            sessionStorage.clear();
            window.location.href="..";
        }
        $(function () {
            //开始时间
            jeDate("#from", {
                format:"YYYY/MM/DD",
                isTime:false,
                theme:{bgcolor:"#6494ec",pnColor:"#6494ec"},
                multiPane:false
            });
            //结束时间
            jeDate("#to", {
                format:"YYYY/MM/DD",
                isTime:false,
                theme:{bgcolor:"#6494ec",pnColor:"#6494ec"},
                multiPane:false
            });
        });
        function selectLog() {
            let dateForm = document.getElementsByName("dateForm");
            dateForm.action.value = "${pageContext.request.contextPath}/selectLog/";
            dateForm.submit();
        }
        function deleteLog() {
            let dateForm = document.getElementsByName("dateForm");
            dateForm.action.value = "${pageContext.request.contextPath}/deleteLog/";
            dateForm.submit();
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
<script src="WEB-INF/js/alert.js"></script>
<%
    int deleteLog = -1;
    try {
        deleteLog = (int) session.getAttribute("deleteLog");
    } catch (Exception ignored){}
    if (deleteLog >= 1) {
%>
<script>
    alert("删除成功");
</script>
<%
} else if (deleteLog == 0){
%>
<script>
    alert("删除失败");
</script>
<%
    }
    session.removeAttribute("deleteLog");
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
            <div class="col-md-11 column">
                <form id="dateForm" action="${pageContext.request.contextPath}/selectLog" method="post">
                    <div class="row col-md-12">
                        <div class="col-md-3" style="display: flex">
                            <label for="from" style="font-size: 22px">起始日期</label>&nbsp;
                            <input class="dateinput dateicon" type="text" id="from" name="from" placeholder="请选择开始时间" style="width: 50%" readonly>
                        </div>
                        <div class="col-md-3" style="display: flex">
                            <label for="to" style="font-size: 22px">结束日期</label>&nbsp;
                            <input class="dateinput dateicon" type="text" id="to" name="to" placeholder="请选择结束时间" style="width: 50%" readonly>
                        </div>
                        <div class="col-md-5" style="display: flex">
                            <label for="depo_no" style="font-size: 22px">仓库编号</label>&nbsp;
                            <input type="text" id="depo_no" name="depo_no" placeholder="默认全部" style="width: 30%">
                        </div>
                        <div class="col-md-1">
                            <input class="btn btn-primary" type="submit" style="background-color: cornflowerblue" value="查找">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-11" style="margin: auto; height: 400px; overflow-y: scroll; float: top">
            <table class="table table-hover table-striped">
                <thead>
                <tr class="col-md-12">
                    <th class="col-md-3">时间</th>
                    <th class="col-md-1">仓库编号</th>
                    <th class="col-md-1">货号</th>
                    <th class="col-md-1">出/入库</th>
                    <th class="col-md-1">数量</th>
                    <th class="col-md-2">单价</th>
                    <th class="col-md-2">总价</th>
                    <th class="col-md-1">来源/去向</th>
                </tr>
                </thead>
                <tbody>
                <%--@elvariable id="standingBookList" type="java.util.List"--%>
                <c:forEach var="standingBook" items="${standingBookList}">
                    <tr>
                        <td>${standingBook.time_stamp.toLocaleString()}</td>
                        <td>${standingBook.depo_no}</td>
                        <td>${standingBook.art_no}</td>
                        <td>${standingBook.state?"入库":"出库"}</td>
                        <td>${standingBook.amount}</td>
                        <td>${standingBook.unit_price}</td>
                        <td>${standingBook.total}</td>
                        <td>${standingBook.target}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <br>
        <div class="col-md-24">
            <div class="col-md-2" style="float: right">
                &emsp;&emsp;&emsp;&emsp;&emsp;
                <a href="${pageContext.request.contextPath}/export">
                    <button class="btn btn-primary" style="width: 100px; background-color: cornflowerblue">导出Excel</button>
                </a>
            </div>
        </div>
    </div>
</div>
<footer style="background-color: cornflowerblue; position: absolute; bottom: 0; width: 100%; height: 80px;"></footer>
</body>
</html>
