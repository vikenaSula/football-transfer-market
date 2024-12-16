<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Player Market</title>
</head>
<body>

<div class="m-4">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" ><h1 class="fw-bold">Owners Market</h1></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" aria-current="page" >
                        <h4 class="fw-bold">
                            Welcome <c:out value="${player.user.firstName}"/>
                        </h4>
                    </a>

                </div>
                <div class="navbar-nav ms-auto">
                    <a class="nav-item nav-link" href="/playerDashboard"><button class="btn btn-primary">Player Dashboard</button></a>
                </div>
            </div>
        </div>
    </nav>
</div>


<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="card text-white bg-transparent center">
                <div class="card-body ">
                    <h5 class="card-title">Requests</h5>
                    <div class="table-wrapper tableFixHead">
                        <table class="table table-dark table-responsive">
                            <thead>
                            <tr class="text-center">
                                <th>Request</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${requests}">
                                <tr class="table-primary text-center">
                                    <td class="table-secondary">
                                        <img src="/${request.team.photo.replace("\\", "/")}"
                                            alt="${request.team.name}" draggable="false" style="width:42px;height:42px;"/>
                                        <c:out value="${request.team.name}"></c:out>
                                    </td>
                                    <td class="table-secondary">
                                        <a href="../decline/${request.id}" class="btn decline"></a>
                                        <a href="../accept/${request.id}" class="btn circle-checkmark">&check;</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card text-white bg-transparent center">
                <div class="card-body ">
                    <h5 class="card-title">Answers</h5>
                    <div class="table-wrapper tableFixHead">
                        <table class="table table-dark table-responsive">
                            <thead>
                            <tr class="text-center">
                                <th>Answer</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${answers}">
                                <tr class="table-primary text-center">
                                    <c:if test="${request.answer == true}">
                                        <td class="table-secondary">
                                            <img src="/${request.team.photo.replace("\\", "/")}"
                                                 alt="${request.team.name}" draggable="false" style="width:42px;height:42px;"/>
                                            <div class="green">
                                                <c:out value="${request.team.name}"></c:out> accept your request
                                            </div>
                                        </td>
                                        <td class="table-secondary">
                                            <div class="green">
                                                <a href="../removeAnswer/${request.id}"><button class="decline"></button></a>
                                            </div>
                                        </td>
                                    </c:if>
                                    <c:if test="${request.answer == false}">
                                        <td class="table-secondary">
                                            <img src="/${request.team.photo.replace("\\", "/")}"
                                                 alt="${request.team.name}" draggable="false" style="width:42px;height:42px;"/>
                                            <div class="red">
                                                <c:out value="${request.team.name}"></c:out> decline your request
                                            </div>
                                        </td>
                                        <td class="table-secondary">
                                            <div class="red">
                                                <a href="../removeAnswer/${request.id}"><button class="decline"></button></a>
                                            </div>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <h1 class="text-white">Teams</h1>
        <c:forEach var="team" items="${teamsAvailable}">
        <div class="col-sm-3">
            <div class="card bg-transparent">
                <img src="/${team.photo.replace("\\", "/")}" class="card-img-top" alt="${team.name}"/>
                <div class="card-body">
                    <h5 class="card-title text-white"></h5>
                    <c:choose>
                        <c:when test="${(teamsWithActiveRequest.contains(team))}">
                            <h3 class="text-white"><c:out value="${team.name}"></c:out></h3>
                            <button class="btn btn-primary align-self-center">Request Pending</button>
                        </c:when>
                        <c:otherwise>
                            <h3 class="text-white"><c:out value="${team.name}"></c:out></h3>
                            <a href="../sendRequest/${team.id}"><button class="btn btn-primary align-self-center">Request</button></a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
        </c:forEach>

    </div>
</div>

</body>
</html>