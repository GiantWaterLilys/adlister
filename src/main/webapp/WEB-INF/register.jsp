<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
<%--    <i class="bi bi-exclamation-circle"></i>--%>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <c:choose>
                    <c:when test="${invalidUser}">
                        <div style="color: red">Username is not unique</div>
                    </c:when>
                </c:choose>
                <input id="username" name="username" class="form-control" type="text" value="${register.getUsername()}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <c:choose>
                    <c:when test="${invalidEmail}">
                        <div style="color: red">Email is not valid</div>
                    </c:when>
                </c:choose>
                <input id="email" name="email" class="form-control" type="text" value="${register.getEmail()}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <c:choose>
                    <c:when test="${invalidPassword}">
                        <div style="color: red">Passwords must contain a capital letter, a lowercase letter, a number, and be at least 6 characters long</div>
                    </c:when>
                </c:choose>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <c:choose>
                    <c:when test="${passwordsDontMatch}">
                        <div style="color: red">Passwords must match</div>
                    </c:when>
                </c:choose>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    <jsp:include page="partials/messages.jsp" />
</body>
</html>
