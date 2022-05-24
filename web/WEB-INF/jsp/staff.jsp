<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/13
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<script src="${ctx}/js/alert.js"></script>
<%
    boolean input_success = false;
    boolean output_success = false;
    try {
        input_success = (boolean) session.getAttribute("input_success");
        output_success = (boolean) session.getAttribute("output_success");
    } catch (Exception ignored){}
%>
<%
    if (input_success) {
%>
<script>
    alert("入库操作执行成功");
</script>
<%
        session.removeAttribute("input_success");
    }
%>
<%
    if (output_success) {
%>
<script>
    alert("出库操作执行成功");
</script>
<%
        session.removeAttribute("input_success");
    }
%>
<br>
<br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" style="display: flex">
            <div class="col-md-5 column" style="background-color: cornflowerblue; color: white; float: left; text-align: center; border-radius: 10px">
                <p>入库表</p>
                <form action="${pageContext.request.contextPath}/input" method="post">
                    <div class="form-group">
                        <label for="art_no1" style="color: white">货号：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="art_no" id="art_no1" required>
                        <br>
                        <br>
                        <label for="name1" style="color: white">货物名称：</label>&emsp;&emsp;
                        <input type="text" name="name" id="name1" required>
                        <br>
                        <br>
                        <label for="depo_no1" style="color: white">仓库编号：</label>&emsp;&emsp;
                        <input type="text" name="depo_no" id="depo_no1" required>
                        <br>
                        <br>
                        <label for="amount1" style="color: white">数量：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="amount" id="amount1" required>
                        <br>
                        <br>
                        <label for="unit_price1" style="color: white">单价：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="unit_price" id="unit_price1" required>
                        <br>
                        <br>
                        <label for="target1" style="color: white">来源/去向：</label>&emsp;&emsp;
                        <input type="text" name="target" id="target1" required>
                        <br>
                        <br>
                        <label for="direction1" style="color: white">状态：</label>&emsp;&emsp;&emsp;&emsp;
                        <select style="color: cornflowerblue" name="direction" id="direction1" required>
                            <option>--请选择--</option>
                            <option value="1">进货</option>
                            <option value="0">退货</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" style="width: 120px; background-color: cornflowerblue" value="提交">
                    </div>
                </form>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5 column" style="background-color: cornflowerblue; color: white; float: left; text-align: center; border-radius: 10px">
                <p>出库表</p>
                <form action="${pageContext.request.contextPath}/output" method="post">
                    <div class="form-group">
                        <label for="art_no2" style="color: white">货号：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="art_no" id="art_no2" required>
                        <br>
                        <br>
                        <label for="name2" style="color: white">货物名称：</label>&emsp;&emsp;
                        <input type="text" name="name" id="name2" required>
                        <br>
                        <br>
                        <label for="depo_no2" style="color: white">仓库编号：</label>&emsp;&emsp;
                        <input type="text" name="depo_no" id="depo_no2" required>
                        <br>
                        <br>
                        <label for="amount2" style="color: white">数量：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="amount" id="amount2" required>
                        <br>
                        <br>
                        <label for="unit_price2" style="color: white">单价：</label>&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="unit_price" id="unit_price2" required>
                        <br>
                        <br>
                        <label for="target2" style="color: white">来源/去向：</label>&emsp;&emsp;
                        <input type="text" name="target" id="target2" required>
                        <br>
                        <br>
                        <label for="direction2" style="color: white">状态：</label>&emsp;&emsp;&emsp;&emsp;
                        <select style="color: cornflowerblue" name="direction" id="direction2" required>
                            <option>--请选择--</option>
                            <option value="1">领料</option>
                            <option value="0">退料</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" style="width: 120px; background-color: cornflowerblue" value="提交">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
