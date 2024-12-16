<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owners Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
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
                            Welcome <c:out value="${loggedInUser.firstName}"/>
                        </h4>
                    </a>

                </div>
                <div class="navbar-nav ms-auto">
                    <a class="nav-item nav-link" href="/ownerDashboard"><button class="btn btn-primary">Owner Dashboard</button></a>
                </div>
            </div>
        </div>
    </nav>
</div>



<div class="container ">
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
                                <th colspan="2">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${allRequests}">
                                <tr class="table-primary text-center">
                                    <td class="table-secondary"><c:out value="${request.player.user.getFullName()}"/></td>
                                    <td class="table-secondary">
                                        <a href="../accept/${request.id}" class="btn circle-checkmark">&check;</a>
                                        <a href="/decline/${request.id}" class="btn decline"></a>
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
                            <c:forEach var="request" items="${allAnswers}">
                                <tr class="table-primary text-center">
                                    <c:if test="${request.answer == true}">
                                        <td class="table-secondary">
                                            <div class="green">
                                                <c:out value="${request.player.user.getFullName()}"/> accepted your request
                                            </div>
                                        </td>
                                        <td class="table-secondary">
                                            <div class="green">
                                                <a href="/removeAnswer/${request.id}"><button class="decline"></button></a>
                                            </div>
                                        </td>
                                    </c:if>
                                    <c:if test="${request.answer == false}">
                                        <td class="table-secondary">
                                            <div class="red">
                                                <c:out value="${request.player.user.getFullName()}"/> declined your request
                                            </div>
                                        </td>
                                        <td class="table-secondary">
                                            <div class="red">
                                                <a href="/removeAnswer/${request.id}"><button class="decline"></button></a>
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
        <h1 class="text-white">Players</h1>
        <c:forEach var="player" items="${allPlayers}">
            <div class="col-sm-3">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <div class="fut-player-card">
                                <div class="player-card-top">
                                    <div class="player-master-info">
                                        <div class="player-rating"><span><c:out value="${player.marketValue}"/>M $</span></div>
                                        <div class="player-position"><span>${player.position}</span></div>
                                        <div class="player-club"><img
                                                src="/${player.team.photo.replace("\\", "/")}"
                                                alt="${player.team.name}" draggable="false" /></div>
                                    </div>
                                    <div class="player-picture">
                                        <img src="/${player.user.photo.replace("\\", "/")}" alt="${player.user.firstName}" draggable="false" />
                                    </div>



                                </div>
                                <div class="player-card-bottom">
                                    <div class="player-info">

                                        <div class="player-name"><span>${player.user.firstName}</span></div>
                                        <div class="player-features">
                                            <div class="player-features-col"><span>
                                                    <div class="player-feature-value">${player.skills.substring(0,3)}</div>
                                                    <div class="player-feature-title">PAC</div>
                                                </span><span>
                                                    <div class="player-feature-value">${player.skills.substring(14,17)}</div>
                                                    <div class="player-feature-title">SHO</div>
                                                </span><span>
                                                    <div class="player-feature-value">${player.skills.substring(28,31)}</div>
                                                    <div class="player-feature-title">PAS</div>
                                                </span></div>
                                            <div class="player-features-col"><span>
                                                    <div class="player-feature-value">${player.skills.substring(7,10)}</div>
                                                    <div class="player-feature-title">DRI</div>
                                                </span><span>
                                                    <div class="player-feature-value">${player.skills.substring(21,24)}</div>
                                                    <div class="player-feature-title">DEF</div>
                                                </span><span>
                                                    <div class="player-feature-value">${player.skills.substring(35,38)}</div>
                                                    <div class="player-feature-title">PHY</div>
                                                </span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="flip-card-back">
                            <div class="fut-player-card">
                                <div class="player-card-top">
                                    <div class="player-master-info">
                                        <div class="player-rating"><span><c:out value="${player.marketValue}"/>M $</span></div>
                                        <div class="player-position"><span>${player.position}</span></div>
                                        <div class="player-club"><img
                                                src="/${player.team.photo.replace("\\", "/")}"
                                                alt="${player.team.name}" draggable="false" /></div>
                                    </div>
                                    <div class="player-picture"><img src="/${player.user.photo.replace("\\", "/")}" alt="${player.user.firstName}" draggable="false" />

                                    </div>
                                </div>
                                <div class="player-card-bottom">
                                    <div class="player-info">

                                        <div class="player-name"><span>${player.user.firstName}</span></div>
                                        <div class="player-features">

                                            <c:choose>
                                                <c:when test="${(playersWithActiveRequest.contains(player))}">
                                                    <button class="gradient-btn">Request Pending</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/sendRequest/${player.id}"><button class="gradient-btn">Request</button></a>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>

    </div>

</div>
</body>
</html>