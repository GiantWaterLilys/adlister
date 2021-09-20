<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">

        <div class="col-md-6">
            <h2><a href="http://localhost:8080/ads/ad-info?id=${ad.id}&userid=${ad.userId}">${ad.title}</a></h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
