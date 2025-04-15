<%--
  Created by IntelliJ IDEA.
  User: Divyansh
  Date: 4/15/2025
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
<%
    HttpSession session1 = request.getSession(false);
    String username = null;

    if (session1 != null) {
        username = (String) session.getAttribute("username");
    }

    if (username != null) {
%>
<h1>Welcome, <%= username %>!</h1>
<p>You have successfully logged in.</p>
<%
} else {
%>
<h1>You are not logged in!</h1>
<p><a href="login.html">Go to Login Page</a></p>
<%
    }
%>
</body>
</html>
