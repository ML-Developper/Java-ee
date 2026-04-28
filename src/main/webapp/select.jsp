<%@ page contentType="text/html;charset=UTF-8" %>


<%@ page import = "java.io.*,java.sql.*"%>

<%@ page import = "javax.servlet.http.*,javax.servlet.*"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
    <title>Select Operator</title>
</head>

<body>




<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root" password=""/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from employees;
</sql:query>

<table border="1" width="100%">
    <tr>
        <th>Emp ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Age</th>
    </tr>

    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.id}"/></td>
            <td><c:out value="${row.first}"/></td>
            <td><c:out value="${row.last}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>