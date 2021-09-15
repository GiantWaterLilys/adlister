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
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <div class="col-md-6">
        <h3>${ads.title}</h3>
        <p>${ads.description}</p>
    </div>

</div>

</body>
</html>
