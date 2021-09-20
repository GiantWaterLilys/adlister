<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <form action="/search" method="post">
        <div class="form-group">
            <label for="username">Enter search term here</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    <c:forEach var="ad" items="${ads}">

        <div class="col-md-6">
            <h2><a href="http://localhost:8080/ads/ad-info?id=${ad.id}&userid=${ad.userId}">${ad.title}</a></h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
