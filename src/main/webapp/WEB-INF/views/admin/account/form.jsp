<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>


<form:form action="/admin/account/create" modelAttribute="item">

    <div class="row">
        <div class="col-4">Username:</div>
        <div class="col-8" style="color: red">
            <form:input path="username" class="form-control" type="text"
                        aria-label="default input example" />
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-4">Password :</div>
        <div class="col-8" style="color: red">
            <form:input path="password" class="form-control" type="text"
                        aria-label="default input example"/>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-4">Fullname :</div>
        <div class="col-8" style="color: red">
            <form:input path="fullname" class="form-control" type="text"
                        aria-label="default input example"/>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-4">Email :</div>
        <div class="col-8" style="color: red">
            <form:input path="email" class="form-control" type="text"
                        aria-label="default input example"/>
        </div>
    </div>

    <form:button type="submit" class="btn btn-primary" onclick="return alert('Bạn đã Thêm thành công')">Add</form:button>
</form:form>
