<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Connexion --%>
<sql:setDataSource
        var="snapshot"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/test"
        user="root"
        password=""/>

<%-- Actions CRUD --%>
<c:set var="action" value="${param.action}"/>

<c:if test="${action == 'insert'}">
    <sql:update dataSource="${snapshot}">
        INSERT INTO employees (id, first, last, age) VALUES (?, ?, ?, ?)
        <sql:param value="${param.id}"/>
        <sql:param value="${param.first}"/>
        <sql:param value="${param.last}"/>
        <sql:param value="${param.age}"/>
    </sql:update>
</c:if>

<c:if test="${action == 'update'}">
    <sql:update dataSource="${snapshot}">
        UPDATE employees SET first = ?, last = ?, age = ? WHERE id = ?
        <sql:param value="${param.first}"/>
        <sql:param value="${param.last}"/>
        <sql:param value="${param.age}"/>
        <sql:param value="${param.id}"/>
    </sql:update>
</c:if>

<c:if test="${action == 'delete'}">
    <sql:update dataSource="${snapshot}">
        DELETE FROM employees WHERE id = ?
        <sql:param value="${param.id}"/>
    </sql:update>
</c:if>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM employees ORDER BY id
</sql:query>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Gestion des Employes</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body class="bg-light">

<div class="container py-4">

    <h2 class="text-center mb-4">
        <span class="badge bg-primary fs-5">Gestion des Employes</span>
    </h2>

    <%-- Notifications --%>
    <c:if test="${action == 'insert'}">
        <div class="alert alert-success alert-dismissible fade show">
            Employe ajoute avec succes.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${action == 'update'}">
        <div class="alert alert-warning alert-dismissible fade show">
            Employe modifie avec succes.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${action == 'delete'}">
        <div class="alert alert-danger alert-dismissible fade show">
            Employe supprime avec succes.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <%-- AJOUTER --%>
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-success text-white fw-bold">+ Ajouter un employe</div>
        <div class="card-body">
            <form method="post" action="dynamique.jsp">
                <input type="hidden" name="action" value="insert"/>
                <div class="row g-2">
                    <div class="col-6 col-md-2">
                        <label class="form-label">ID</label>
                        <input type="number" name="id" class="form-control" placeholder="ex: 7" required/>
                    </div>
                    <div class="col-6 col-md-3">
                        <label class="form-label">Prenom</label>
                        <input type="text" name="first" class="form-control" placeholder="ex: Ahmed" required/>
                    </div>
                    <div class="col-6 col-md-3">
                        <label class="form-label">Nom</label>
                        <input type="text" name="last" class="form-control" placeholder="ex: Ben Ali" required/>
                    </div>
                    <div class="col-6 col-md-2">
                        <label class="form-label">Age</label>
                        <input type="number" name="age" class="form-control" placeholder="ex: 30" required/>
                    </div>
                    <div class="col-12 col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-success w-100">Ajouter</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%-- MODIFIER --%>
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-warning fw-bold">Modifier un employe</div>
        <div class="card-body">
            <form method="post" action="dynamique.jsp">
                <input type="hidden" name="action" value="update"/>
                <div class="row g-2">
                    <div class="col-6 col-md-2">
                        <label class="form-label">ID</label>
                        <input type="number" name="id" class="form-control" placeholder="ID existant" required/>
                    </div>
                    <div class="col-6 col-md-3">
                        <label class="form-label">Nouveau prenom</label>
                        <input type="text" name="first" class="form-control" placeholder="ex: Sami" required/>
                    </div>
                    <div class="col-6 col-md-3">
                        <label class="form-label">Nouveau nom</label>
                        <input type="text" name="last" class="form-control" placeholder="ex: Chabbi" required/>
                    </div>
                    <div class="col-6 col-md-2">
                        <label class="form-label">Nouvel age</label>
                        <input type="number" name="age" class="form-control" placeholder="ex: 28" required/>
                    </div>
                    <div class="col-12 col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-warning w-100">Modifier</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%-- SUPPRIMER --%>
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-danger text-white fw-bold">Supprimer un employe</div>
        <div class="card-body">
            <form method="post" action="dynamique.jsp">
                <input type="hidden" name="action" value="delete"/>
                <div class="row g-2">
                    <div class="col-6 col-md-3">
                        <label class="form-label">ID a supprimer</label>
                        <input type="number" name="id" class="form-control" placeholder="ex: 5" required/>
                    </div>
                    <div class="col-6 col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-danger w-100">Supprimer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%-- TABLEAU --%>
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white fw-bold">Liste des employes</div>
        <div class="card-body p-0">
            <c:choose>
                <c:when test="${result.rowCount == 0}">
                    <p class="text-center text-muted py-4">Aucun employe trouve.</p>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-bordered mb-0">
                            <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Prenom</th>
                                <th>Nom</th>
                                <th>Age</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td>${row.id}</td>
                                    <td>${row.first}</td>
                                    <td>${row.last}</td>
                                    <td>${row.age}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>