<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Calculator</h2>
<form action="/discount" method="post">
    <input type="text" name="product_description" placeholder="Enter Product: "/><br>
    <input type="number" name="price" placeholder="Enter price: "/><br>
    <input type="number" name="percent" placeholder="Enter discount percent"/><br>
    <input type="submit" name="submit" value="Calculate Discount"/>
</form>
</body>
</html>