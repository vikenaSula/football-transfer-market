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

    <title>Owner Profile</title>
</head>

<body>

<aside class="profile-card">

    <header>

        <div class="buttons ">
            <form class="float-start d-inline-block" id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" value="Log out" class="btn btn-danger" />
            </form>
            <a class="float-end d-inline-block" href="/ownerMarket">
                <button class="btn btn-primary">Market</button>
            </a>
        </div>

        <a>
            <img src="${loggedInUser.photo}">
        </a>

        <h1 class="fw-bolder">Welcome  <c:out value="${loggedInUser.firstName}"></c:out></h1>


    </header>

    <div class="profile-bio">

        <p class="fw-bold"><c:out value="${loggedInUser.owner.description}"></c:out></p>

    </div>
    <div>

        <p class="fw-bold">Team:

            <a href="/ownerDashboard/team/${loggedInUser.owner.team.id }">
                <c:out value="${loggedInUser.owner.team.name}"/>
            </a>
        </p>

    </div>

</aside>

</body>
</html>