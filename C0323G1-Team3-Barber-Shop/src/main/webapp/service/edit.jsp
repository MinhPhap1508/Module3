<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/6/2023
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<center>
    <h1>Barber Shop</h1>
    <h2>
        <a href="/ServiceServlet">Trở về trang danh sách</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/ServiceServlet?action=edit&id=${service.getServiceId()}">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Chỉnh sửa dịch vụ</h2>
            </caption>
            <c:if test="${service != null}">
                <input type="hidden" name="id" value="${service.getServiceId()}"/>
            </c:if>
            <tr>
                <th>Tên dịch vụ:</th>
                <td>
                    <input type="text" name="name" id="name" value="${service.getServiceName()}" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Giá:</th>
                <td>
                    <input type="number" name="price" id="price" value="${service.getPrice()}" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Chỉnh sửa"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
