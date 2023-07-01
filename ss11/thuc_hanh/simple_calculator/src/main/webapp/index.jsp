<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calcualator</h1>
<form action="CalculatorServlet" method="post">
    <header>Calculator</header>
    <table border: style="border: 1px solid">
        <tr>
            <td>First operand: </td>
            <td><input type="number" name="first_operand"/></td>
        </tr>
        <tr>
            <td>Operator</td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand</td>
            <td><input type="number" name="second_operand"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculator"/></td>
        </tr>
    </table>
</form>
</body>
</html>