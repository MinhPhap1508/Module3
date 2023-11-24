<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Cash</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <button><a href="/CashServlet?action=add" type="submit" class="btn btn-outline-primary" role="button">Thêm mới</a> </button>
    <table class="table table-striped">
        <tr>
            <th>STT</th>
            <th>Tên vấn đề</th>
            <th>Hình thức</th>
            <th>Ngày xảy ra</th>
            <th>Số tiền</th>
            <th>Nội dung chi tiết</th>
            <th>Chức năng</th>
        </tr>
        <c:forEach var="cash" items="${cashList}" varStatus="loop">
            <tr>
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${cash.getName()}"/></td>
                <td><c:out value="${cash.isChoose()}"/></td>
                <td><c:out value="${cash.getDate()}"/></td>
                <td><c:out value="${cash.getPrice()}"/></td>
                <td><c:out value="${cash.getDescription()}"/></td>
                <td><a href="/CashServlet?action=delete&id=${cash.getId()}" type="submit" role="button" class="btn btn-primary">Xóa</a> </td>
            </tr>
        </c:forEach>
    </table>

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
