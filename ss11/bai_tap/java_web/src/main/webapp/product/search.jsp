<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/3/2023
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<h1>Tìm kiếm sản phẩm</h1>
<p><a href="/ProductServlet">Trở về trang chính</a> </p>
<form action="/ProductServlet?action=search" method="post">
  <label for="search">Nhập tên sản phẩm</label>
  <input type="text" name="search" id="search"><br>
  <input type="submit" value="Tìm kiếm">
    <c:if test="${products !=null}">
        <c:forEach var="product" items="${products}">
            <table style="border: 1px solid coral">
                <tr>
                    <td>Tên sản phẩm</td>
                    <td>Giá sản phẩm</td>
                    <td>Mô tả</td>
                    <td>Xuất xứ</td>
                </tr>
                <tr>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getDescription()}</td>
                    <td>${product.getProducer()}</td>
                </tr>
            </table>
        </c:forEach>
    </c:if>
</form>
</body>
</html>
