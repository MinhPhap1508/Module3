<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/3/2023
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<h1>Chỉnh sửa thông tin</h1>
<p>
    <a href="/ProductServlet">Trở về trang chính</a>
</p>
<form action="/ProductServlet?action=update&id=${product.getId()}" method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm</td>
                <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td>Xuất xử sản phẩm</td>
                <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Chỉnh sửa sản phẩm"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
