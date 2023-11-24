<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2023
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Add</title>
    <style>
        a{
            text-decoration: none;
        }
        .navbar.navbar-expand-lg {
            background-color: #d5b981;
        }

        .navbar.navbar-expand-lg .navbar-nav .nav-link {
            color: #000000;
            font-weight: bold;
        }
        input[type=text],[type=number] {  width: 100%;  padding: 12px 20px;  margin: 8px 0;  box-sizing: border-box;
        border: 2px solid #1d2434; border-radius: 4px; background-color: #d5b981; color: black;}
    </style>
</head>
<body>
<div class="navbar navbar-expand-lg navbar-nav nav-link" style="top: 0">
    <div class="container-fluid">
        <a href="index.html" class="navbar-brand text-dark">Barber <span>Cường Nhựa</span></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between " id="navbarCollapse">
            <div class="navbar-nav ml-auto ">
                <a href="/ServiceServlet" class="nav-item nav-link active">Home</a>
            </div>
        </div>
    </div>
</div>
    <form method="post" action="/ServiceServlet?action=add" class="container">
        <caption>
            <h2>Thêm mới dịch vụ</h2>
        </caption>
        <table border="1" cellpadding="5">
            <tr>
                <th>Tên dịch vụ:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Giá:</th>
                <td>
                    <input type="number" name="price" id="price" size="45"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" value="Thêm mới" role="button" class="btn btn-outline-primary">Thêm mới</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
