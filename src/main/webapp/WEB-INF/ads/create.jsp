<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
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
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${ad.getTitle()}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${ad.getDescription()}</textarea>
            </div>
            <c:choose>
                <c:when test="${wasAnError != null}">
                    <div style="color: red">One or more of the required fields was empty!</div>
                </c:when>
            </c:choose>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
