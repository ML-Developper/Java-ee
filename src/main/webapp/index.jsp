<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Liste des noms</title>
</head>

<body>

<h2>Liste des noms</h2>

<%
    java.util.List<String> noms = java.util.Arrays.asList("Ali", "Sami", "Leila");
    request.setAttribute("noms", noms);
%>

<ul>
    <c:forEach var="n" items="${noms}">
        <li>${n}</li>
    </c:forEach>
</ul>

</body>
</html>
