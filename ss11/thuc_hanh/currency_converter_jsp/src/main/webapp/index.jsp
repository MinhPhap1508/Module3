<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Conveter</title>
</head>
<body>
<h2>Currency Conveter</h2>
<form action="converter.jsp" method="post">
    <label>Rate:</label> <br>
    <input type="number" name="rate" placeholder="Enter rate" value="22000"/><br>
    <label>USD: </label> <br>
    <input type="number" name="USD" placeholder="Enter USD: " value="0"/><br>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>