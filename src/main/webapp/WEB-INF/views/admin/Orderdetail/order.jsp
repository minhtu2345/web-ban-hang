<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/9/2023
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<html>
<head>
    <title>Title</title>
</head>
<body>
<center><h3 >Order MANAGEMENT</h3></center>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Tên Sản Phẩm</th>
        <th>Số Lượng</th>
        <th>Tên người đặt</th>
        <th>Địa Chỉ</th>
        <th>Ngày đặt</th>
        <th>Giá</th>
        <th> </th>
    </tr>
    <c:forEach var="item" items="${items}">
        <tr>
            <td>${item.id}</td>
            <td>${item.product.name}</td>
            <td>${item.quantity}</td>
            <td>${item.order.account.username}</td>
            <td>${item.order.address}</td>
            <td>${item.order.createDate}</td>
            <td>${item.price * item.quantity}</td>
            <td>  <a href="/admin/orderdetail/delete/${item.id}" class="btn btn-sm btn-danger" onclick="return confirm('Khách hàng đã nhận hàng!!')"> Đã Nhận</a> </td>

        </tr>
    </c:forEach>
</table>

<%--<center><h3 >Tổng</h3></center>--%>

<%--<table border="1" style="width:100%">--%>
<%--    <tr>--%>
<%--        <th>Số đơn</th>--%>
<%--        <th>Tổng giá</th>--%>
<%--        <th>Số sản phẩm</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="item" items="${itemss}">--%>
<%--        <tr>--%>
<%--            <td>${item.group.id}</td>--%>
<%--            <td>${item.sum}</td>--%>
<%--            <td>${item.count}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
</body>
</html>
