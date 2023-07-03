<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!--Section1-->

<style>
  .section-title {
    margin-bottom: 50px;
    text-align: center;
  }

  .section-title h2 {
    color: #1c1c1c;
    font-weight: 500;
    position: relative;
  }

  .section-title h2:after {
    position: absolute;
    left: 0;
    bottom: -15px;
    right: 0;
    height: 4px;
    width: 80px;
    background: #7fad39;
    content: "";
    margin: 0 auto;
  }

</style>

<section class="section1">
  <div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
      <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="0"
              class="active"
              aria-current="true"
              aria-label="Slide 1"
      ></button>
      <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="1"
              aria-label="Slide 2"
      ></button>
      <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="2"
              aria-label="Slide 3"
      ></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/1/638238052854630945_F-C1_1200x300@2x.png" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/1/638237684248000102_F-C1_1200x300.png" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/1/638238059582203024_F-C1_1200x300ip13.png" class="d-block w-100" alt="..." />
      </div>
    </div>
    <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</section>

<div class="container mt-5 mb-5">
  <div class="row">
    <div class="col-3 p-3 card">
      <form action="/">
        <div class="product-search-info mt-3">
          <label for="keywords" class="mb-1"><b>Tên sản phẩm:</b></label>
          <input name="keywords" value="${keywords}" class="form-control" placeholder="Nhập tên sản phẩm để tìm" />
        </div>

        <div class="brand-search-info mt-3">
          <label for="brandId"><b>Loại sản phẩm:</b></label>
          <div class="mt-2">
            <input type="radio" name="categoryId" checked value="" />
            <span>Tất cả</span>
          </div>
          <c:forEach var="c" items="${categoryList}">
              <div class="mt-1">
                <input name="categoryId" type="radio" value="${c.id}"
                    <c:if test="${param.categoryId==c.id}">checked</c:if>
                />
                <span>${c.name}</span>
              </div>
          </c:forEach>
        </div>

        <div class="price-search-info mt-3">
          <label for="priceRange"><b>Mức giá:</b></label>
              <c:forEach var="pr" items="${priceRangeList}">
            <div class="mt-2">
              <input type="radio" name="priceRangeId" value="${pr.id}"
                  <c:if test="${param.priceRangeId==pr.id}">checked</c:if>
              />
              <span>${pr.display}</span>
            </div>
          </c:forEach>
        </div>
        <button type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
      </form>
    </div>

    <div class="col-9">
      <ul class="list-unstyled row">
        <c:forEach var="product" items="${page.content}">
            <li class="list-item col-sm-4 mt-3">
              <div class="item-container">
                <a href="/detail/${product.id}" class="product-item">
                  <img src="${product.image}" class="product-image" alt="" />
                  <div class="item-info">
                    <div>
                      <span class="product-name">${product.name}</span>
                    </div>
                    <div>
                      <span class="price-title">Giá bán :</span>
                      <span class="price">${product.price} ₫</span>
                    </div>
                  </div>
                </a>
              </div>
            </li>
         </c:forEach>
      </ul>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item ${!page.hasPrevious() ? 'disabled' : ''}">
            <a class="page-link" href="?p=0&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}&keywords=${param.keywords}">&laquo;</a>
          </li>
          <li class="page-item ${!page.hasPrevious() ? 'disabled' : ''}">
            <a class="page-link" href="?p=${page.number-1}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}&keywords=${param.keywords}">&lsaquo;</a>
          </li>
          <li class="page-item ${page.numberOfElements == 0 ? 'disabled' : ''}">
            <a class="page-link" href="?p=${page.number+1}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}&keywords=${param.keywords}">&rsaquo;</a>
          </li>
          <li class="page-item ${page.numberOfElements == 0 ? 'disabled' : ''}">
            <a class="page-link" href="?p=${page.totalPages-1}&categoryId=${param.categoryId}&priceRangeId=${param.priceRangeId}&keyword=${param.keyword}">&raquo;</a>
          </li>
        </ul>
        <span>Hiển thị 1-5 trên tổng số 7 sản phẩm</span>
      </nav>
    </div>
  </div>
</div>

<style>
  .product-image {
    max-width: 95%;
    max-height: 200px;
  }

  .price-title {
    font-style: italic;
    font-size: 14px;
  }

  .price {
    font-size: 16px;
    font-weight: bold;
  }

  .product-item,
  .product-item:link,
  .product-item:hover,
  .product-item:visited {
    text-decoration: none;
    color: black;
  }

  .item-container {
    position: relative;
    height: 100%;
    padding-bottom: 50px;
  }

  .item-info {
    position: absolute;
    bottom: 0px;
    height: 50px;
  }
</style>