<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/owner.css">
    <title>Player Profile</title>
</head>

<body>

<aside class="profile-card">

    <header>

        <div class="buttons ">
            <form class="float-start d-inline-block" id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" value="Log out" class="btn btn-danger" />
            </form>
            <a class="d-inline-block" href="/editPlayer/${loggedInUser.id }">
                <button class="btn btn-info">Edit</button>
            </a>
            <a class="float-end d-inline-block" href="/playerMarket">
                <button class="btn btn-primary">Market</button>
            </a>
        </div>

        <a>
            <img src="${loggedInUser.photo}">
        </a>

        <h1 class="fw-bolder">Welcome  <c:out value="${loggedInUser.firstName}"></c:out></h1>


    </header>



    <div class="profile-bio">
        <p class="fw-bold">
            Skills:
        </p>
        <div class="row">
            <div class="col-sm">
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(0,3)}"></c:out></a>
                    <p class="fw-bold">PAC</p>
                </div>
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(14,17)}"></c:out></a>
                    <p class="fw-bold">SHO</p>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(28,31)}"></c:out></a>
                    <p class="fw-bold">PAS</p>
                </div>
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(7,10)}"></c:out></a>
                    <p class="fw-bold">DRI</p>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(21,24)}"></c:out></a>
                    <p class="fw-bold">DEF</p>
                </div>
                <div class="row">
                    <a class="fw-bold">
                        <c:out value="${loggedInUser.player.skills.substring(35,38)}"></c:out></a>
                    <p class="fw-bold">PHY</p>
                </div>
            </div>

        </div>


    </div>
    <div class="row">
        <div class="col-sm">
            <p class="fw-bold">Team:
                <c:choose>
                <c:when test="${(loggedInUser.player.team.name != null)}">
                <a href="/playerDashboard/team/${loggedInUser.player.team.id }">
                    <c:out value="${loggedInUser.player.team.name}"/>
                </a>
            </c:when>
            <c:otherwise>
                <a class="fw-bold">No Team</a>
            </c:otherwise>
            </c:choose>

            </p>
        </div>
        <div class="col-sm">
            <p class="fw-bold">Market Value:

                <a class="fw-bold">
                    <c:out value="${loggedInUser.player.marketValue}"/>M $
                </a>
            </p>
        </div>

    </div>

</aside>

</body>
</html>