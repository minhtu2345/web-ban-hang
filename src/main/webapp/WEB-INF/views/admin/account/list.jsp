<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>



<table class="table">
    <tr>
        <td>Username</td>
        <td>Password</td>
        <td>Fullname</td>
        <td>email</td>
        <td>Action</td>
    </tr>
    <c:forEach items="${items}" var="item">
        <tr>
            <th>${item.username}</th>
            <th>${item.password}</th>
            <th>${item.fullname}</th>
            <th>${item.email}</th>
            <th>
                <a href="/admin/account/delete/${item.username}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa không!!')"> Delete</a>
            </th>
        </tr>
    </c:forEach>
</table>