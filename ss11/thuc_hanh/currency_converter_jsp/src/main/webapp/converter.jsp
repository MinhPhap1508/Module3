<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/30/2023
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Converter</title>
</head>
<body>
<%
  float rate = Float.parseFloat(request.getParameter("rate"));
  float usd = Float.parseFloat(request.getParameter("USD"));

  float vnd = rate*usd;
  %>
<h1> Rate: <%=rate%></h1>
<h1> USD: <%=usd%></h1>
<h1> VND: <%=vnd%></h1>
</body>
</html>
