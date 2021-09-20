<%--
  Created by IntelliJ IDEA.
  User: seth
  Date: 9/14/21
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <%--    <i class="bi bi-exclamation-circle"></i>--%>
    <style>
        body {
            font-family: 'Anton', sans-serif;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <div class="col-md-6">
        <h1>${ads.title}</h1>
        <p>${ads.description}</p>
        <p>posted by: ${user.username}</p>
        <p>email: ${user.email}</p>

    </div>

</div>

</body>
</html>
