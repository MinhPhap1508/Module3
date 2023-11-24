<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/1/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Bootstrap--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<html>
<head>
    <title>Barber Shop</title>
</head>
<body>
<center>
    <h1>Danh sách dịch vụ</h1>
    <h2><a class="btn btn-outline-primary container" href="/ServiceServlet?action=add" role="button">Thêm mới dịch vụ</a></h2>
</center>
<table border="1px" class="table table-striped container">
    <tr>
        <th>STT</th>
        <th>Tên dịch vụ</th>
        <th>Giá dịch vụ</th>
        <th>Chỉnh sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="service" items="${serviceList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><c:out value="${service.serviceName}"/></td>
            <td><c:out value="${service.price}"/></td>
            <td><a class="btn btn-primary" href="/ServiceServlet?action=edit&id=${service.getServiceId()}"
                   role="button">Sửa</a></td>
            <td><a class="btn btn-danger" href="/ServiceServlet?action=delete&id=${service.getServiceId()}"
                   role="button">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
