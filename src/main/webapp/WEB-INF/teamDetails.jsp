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
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <title>Team Details</title>
</head>
<body>

<div class="m-4">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" ><h1 class="fw-bold">${teamName}</h1></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" aria-current="page" >
                        <h4 class="fw-bold">
                            Welcome <c:out value="${currentUser.firstName}"/>
                        </h4>
                    </a>

                </div>
                <div class="navbar-nav ms-auto">
                    <c:if test="${isOwner}">
                        <a class="nav-item nav-link" href="/ownerDashboard"><button class="btn btn-primary">Owner Dashboard</button></a>
                    </c:if>
                    <c:if test="${isPlayer}">
                        <a class="nav-item nav-link" href="/playerDashboard"><button class="btn btn-primary">Player Dashboard</button></a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</div>



<c:if test="${isOwner}">
    <div class="container">
        <div class="row">
            <c:forEach var="player" items="${players}">
                <div class="col-sm-3">
                        <div class="flip-card">
                            <div class="flip-card-inner">
                                <div class="flip-card-front">
                                    <div class="fut-player-card">
                                        <div class="player-card-top">
                                            <div class="player-master-info">
                                                <div class="player-rating"><span></span></div>
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
                                                <div class="player-rating"><span></span></div>
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

                                                        <button class="gradient-btn"><a href="/ownerDashboard/team/remove/${player.id}">Remove Player</a></button>

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
</c:if>

<c:if test="${isPlayer}">

<div class="container">
    <div class="row">
        <c:forEach var="player" items="${players}">
            <div class="col-sm-3">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <div class="fut-player-card">
                                <div class="player-card-top">
                                    <div class="player-master-info">
                                        <div class="player-rating"><span></span></div>
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
                                        <div class="player-rating"><span></span></div>
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
                                            <c:if test="${player.id == currentUser.getPlayer().getId()}">
                                            <button class="gradient-btn"><a href="/playerDashboard/team/leave/${team.id}">Leave Team</a></button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </c:forEach>
        </c:if>

    </div>
</div>

</body>
</html>