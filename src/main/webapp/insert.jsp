<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
  <title>Insert Operator</title>
</head>
<body>

<sql:setDataSource
        var="snapshot"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/test"
        user="root"
        password="" />

<sql:update dataSource="${snapshot}" var="updateResult">
  INSERT INTO employees VALUES (6, 'kkkkkk', 'mmmmm', 60)
</sql:update>

<sql:query dataSource="${snapshot}" var="result">
  SELECT * FROM employees
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