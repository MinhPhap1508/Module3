<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/3/2023
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p><a href="/ProductServlet">Trở về trang chính</a> </p>

<form action="/ProductServlet?action=delete&id=${product.getId()}"method="post">
<h3>Bạn có mốn xóa không</h3>
  <fieldset>
    <legend>Customer information</legend>
    <table>
      <tr>
        <td>Tên sản phẩm</td>
        <td>${product.getName()}</td>
      </tr>
      <tr>
        <td>Giá sản phẩm</td>
        <td>${product.getPrice()}</td>
      </tr>
      <tr>
        <td>Mô tả sản phẩm</td>
        <td>${product.getDescription()}</td>
      </tr>
      <tr>
        <td>Nhà sản xuất</td>
        <td>${product.getProducer()}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete Customer"></td>
        <td><a href="/ProductServlet">Trở về trang chính</a></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
