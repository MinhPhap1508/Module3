<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/14/2023
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div style="width: 50%;margin-left: 30%;margin-top: 2%" align="center"  class=" shadow-lg p-3 mb-5 bg-body rounded">

  <form method="post" action="/CashServlet?action=add"  class="row g-3 " >
    <div class="col-12  text-dark  bg-dar.bg-gradient">
      <h1>Thêm mới </h1>
    </div>
    <div class="col-12  text-dark  bg-dar.bg-gradient">
      <label for="name" class="form-label">Tên vấn đề </label>
      <input type="text" class="form-control"  id="name"  name="name">
    </div>
    <div class="col-12  text-dark  bg-dar.bg-gradient">
      <p>Chọn hình thức</p>
      <select> Chọn hình thức
        <option name="choose">Thu  </option>
        <option name="choose">Chi</option>
      </select>
    </div>
    <div class="col-12  text-dark  bg-dar.bg-gradient">
      <label for="date" class="form-label">Ngày xảy ra </label>
      <input type="text" class="form-control"  id="date" name="" >
    </div>
    <div class="col-12  text-dark  bg-dar.bg-gradient">

      <label for="price" class="form-label"> Số tiền </label>
      <input type="number" class="form-control"  id="price" name="price">
    </div>
    <div class="col-12  text-dark  bg-dar.bg-gradient">
      <label for="description" class="form-label">Mô tả </label>
      <input type="text" class="form-control"  id="description" name="description">
    </div>
    <div class="col-6 text-dark bg-dar.bg-gradient">
      <input type="submit" class="btn btn-primary" role="button" value="Thêm mới">
    </div>
    <div class="col-6 text-dark bg-dar.bg-gradient">
      <button><a href="/CashServlet" type="submit" class="btn btn-dark">Hủy</a> </button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
