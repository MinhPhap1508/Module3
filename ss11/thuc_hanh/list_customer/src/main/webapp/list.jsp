<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/30/2023
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1px">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
<c:forEach var="list" items="${customerList}" varStatus="loop">
    <tr>
        <td>${loop.count}</td>
        <td><c:out value="${list.name}"/></td>
        <td><c:out value="${list.date}"/></td>
        <td><c:out value="${list.address}"/></td>
        <td><img src="${list.img}"style="width: 30%" height="30%"/></td>
    </tr>

</c:forEach>
</table>
</body>
</html>
