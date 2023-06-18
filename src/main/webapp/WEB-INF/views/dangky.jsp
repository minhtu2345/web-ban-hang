<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<div class="bg-login">
    <div class="login-form">
        <h3>Đăng Ký</h3>

        <form:form action="/account/dangky" method="POST" style="margin-top: 30px;" modelAttribute="item">
            <div class="mt-3">
                <label for="username" class="mb-1">Tên tài khoản</label>
                <form:input path="username" type="text" class="form-control" ></form:input>
                <form:errors path="username" cssStyle="color: red"></form:errors>
            </div>
            <div class="mt-4">
                <label for="password" class="mb-1">Mật khẩu</label>
                <form:input path="password" type="password" class="form-control" />
                <form:errors path="password" cssStyle="color: red"></form:errors>
            </div>
            <div class="mt-4">
                <label for="fullname" class="mb-1">Fullname</label>
                <form:input path="fullname" type="fullname" class="form-control" />
                <form:errors path="fullname" cssStyle="color: red"></form:errors>
            </div>
            <div class="mt-4">
                <label for="email" class="mb-1">Email</label>
                <form:input path="email" class="form-control" />
                <form:errors path="email" cssStyle="color: red"></form:errors>
            </div>

            <div style="margin-top: 35px;">
                <form:button type="submit" class="btn btn-primary" style="width: 100%;" onclick=" return confirm('Bạn có chắc đăng ký không ')">Đăng Ký</form:button>

            </div>
        </form:form>
        <p class="text-center mt-4"><a href="/">Đăng Nhập</a></p>
    </div>
</div>

<style>
    .bg-login {
        position: relative;
        width: 100%;
        min-height: auto;
        background-position: right 0px top 0px;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    .login-form {
        border: 1px solid #DDD;
        max-width: 400px;
        padding: 20px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }
</style>