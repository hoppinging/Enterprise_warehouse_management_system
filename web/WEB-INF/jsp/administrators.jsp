<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoppi
  Date: 2022/5/13
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" style="display: flex">
            <div class="col-md-5 column" style="background-color: cornflowerblue; color: white; float: left; text-align: center; border-radius: 10px">
                <div class="modal-body">
                    <p>库存显示</p>
                    <div class="row clearfix col-md-12 column" style="float: top">
                        <div class="col-md-3 column">
                            <a href="${pageContext.request.contextPath}/listCargo">
                                <button id="listAllCargo" class="btn btn-primary" style="background: cornflowerblue">查询全部</button>
                            </a>
                        </div>
                        <div class="col-md-3 column"></div>
                        <div class="col-md-6 column">
                            <form action="${pageContext.request.contextPath}/listDepo" method="post">
                                <input type="text" id="depo_no" name="depo_no" style="width: 100px">
                                <input type="submit" class="btn btn-primary" style="background: cornflowerblue; width: 100px" value="查询仓库">
                            </form>
                        </div>
                    </div>
                    <br>
                    <div class="el-col-md-24 column" style="overflow-y: scroll; float: top; height: 300px; background: white; border-radius: 10px">
                        <table class="table table-hover table-striped" style="color: cornflowerblue; border-collapse: collapse; border-top: 1px solid cornflowerblue; border-left: 1px solid cornflowerblue">
                            <thead>
                            <tr>
                                <th>货号</th>
                                <th>所属仓库</th>
                                <th>货物名称</th>
                                <th>数量</th>
                                <th>单价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--@elvariable id="cargoList" type="java.util.List"--%>
                            <c:forEach items="${cargoList}" var="item">
                                <tr>
                                    <td>
                                            ${item.art_no}
                                    </td>
                                    <td>
                                            ${item.depo_no}
                                    </td>
                                    <td>
                                            ${item.name}
                                    </td>
                                    <td>
                                            ${item.amount}
                                    </td>
                                    <td>
                                            ${item.unit_price}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5 column" style="background-color: cornflowerblue; color: white; float: left; text-align: center; border-radius: 10px">
                <div class="modal-body">
                    <p>物料显示</p>
                    <div class="input-group col-md-12 column"  style="float: top">
                        <div class="col-md-10 column"></div>
                        <div class="col-md-2 column">
                            <a href="${pageContext.request.contextPath}/listMaterial">
                                <button id="listAllMaterial" class="flush btn btn-primary" style="background: cornflowerblue">刷新</button>
                            </a>
                        </div>
                    </div>
                    <br>
                    <div class="el-col-md-24 column" style="overflow-y: scroll; float: top; height: 300px; background: white; border-radius: 10px">
                        <table class="table table-hover table-striped" style="color: cornflowerblue; border-collapse: collapse; border-top: 1px solid cornflowerblue; border-left: 1px solid cornflowerblue">
                            <thead>
                            <tr>
                                <th>货号</th>
                                <th>货物名称</th>
                                <th>均价</th>
                                <th>数量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--@elvariable id="materialList" type="java.util.List"--%>
                            <c:forEach items="${materialList}" var="item">
                                <tr>
                                    <td>
                                            ${item.art_no}
                                    </td>
                                    <td>
                                            ${item.name}
                                    </td>
                                    <td>
                                            ${item.avg_price}
                                    </td>
                                    <td>
                                            ${item.amount}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>