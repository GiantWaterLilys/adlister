<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
    <c:when test = "${sessionScope.user.username == null}">

<nav class="navbar navbar-default navbar-static-top"  role = "navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/search">&#128269</a></li>
            <li><a href="${pageContext.request.contextPath}/login?from=${requestScope['javax.servlet.forward.request_uri']}">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

</c:when>
<c:otherwise>

<nav class="navbar navbar-default navbar-static-top"  role = "navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/search">&#128269</a></li>
            <li><a href="${pageContext.request.contextPath}/MyAdsServlet">My Ads</a></li>
            <li><a href="${pageContext.request.contextPath}/ads/create">Create An Ad</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            <li><a href="${pageContext.request.contextPath}/profile">My Profile</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

</c:otherwise>
</c:choose>