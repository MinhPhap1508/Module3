<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/3/2023
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer</title>
</head>
<body>
<h1>Customer Details</h1>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<table>
    <tr>
        <td>Name</td>
        <td>${customer.getName()}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>${customer.getEmail()}</td>
    </tr>
    <tr>
        <td>Address</td>
        <td>${customer.getAddress()}</td>
    </tr>
</table>
</body>
</html>
