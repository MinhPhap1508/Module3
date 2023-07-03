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
</form>
</body>
</html>
