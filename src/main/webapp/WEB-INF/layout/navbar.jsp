<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm bg-light navbar-light p-0">
  <div class="navbar-nav collapse navbar-collapse">
    <a class="navbar-brand" href="#">
      <img src="https://logoart.vn/upload/thiet-ke-logo-chuoi-cua-hang-dien-thoai-the-gioi-alo_logo_1362452600.jpg" alt="Logo" style="width:60px;" class="rounded-pill">
    </a>
    <a class="nav-item nav-link active" href="/">Trang Chủ</a>
    <a class="nav-item nav-link" href="/about">Giới thiệu</a>
    <a class="nav-item nav-link" href="/admin/product/index">Quản Lý Sản Phẩm</a>
    <a class="nav-item nav-link" href="/lienhe">Liện Hệ</a>
  </div>

  <ul class="navbar-nav ml-auto">
    <li class="nav-item no-arrow">
      <c:if test="${cart.total > 0}">
        <a href="/cart" class="nav-link mt-2">
          <i class="bi bi-cart-check"></i>
            (${cart.total})
        </a>
      </c:if>
    </li>
    <li class="nav-item no-arrow">
      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">
        <i class="bi bi-person-circle" style="width:40px"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" href="/logout">
          Đăng xuất
        </a>
      </div>
    </li>
  </ul>
</nav>

