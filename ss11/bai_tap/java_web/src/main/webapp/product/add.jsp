<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/3/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>
    <a href="/ProductServlet">Trở về trang chính</a>
<c:if test="${msg !=null}">
    <c:out value="${msg}"/>
</c:if>
<form action="/ProductServlet?action=create" method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td><input type="text"name="name" id="name"></td>
            </tr>
            <tr>
                <td>Giá</td>
                <td><input type="number"name="price" id="price"></td>
            </tr><tr>
            <td>Mô tả</td>
            <td><input type="text"name="description" id="description"></td>
        </tr><tr>
            <td>Nhà sản xuất</td>
            <td><input type="text"name="producer" id="producer"></td>
        </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Thêm mới"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
