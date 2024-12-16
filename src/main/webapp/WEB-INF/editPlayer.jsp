<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <title>Player Details</title>
</head>
<body id="edit_body">
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4" id="edit_card">
            <div class="card-body" id="card-text" >
                <h2 class="title">Hello, do you want to edit your profile?</h2>

    <%--@elvariable id="myModel" type="java"--%>
    <form:form action="/updatePlayer/${myModel.user.id}" method="put" modelAttribute="myModel" enctype="multipart/form-data">

                <div class="row row-space">
                    <div class="col-2">
                        <div class="input-group">
                            <form:label class="form-label label" path="user.firstName">First Name:</form:label>
                            <form:input class="form-control input--style-4" path="user.firstName" />
                            <form:errors class="error-class" path="user.firstName"/>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="input-group">

                            <form:label class="form-label  label" path="user.lastName">Last Name:</form:label>
                            <form:input class="form-control input--style-4  " path="user.lastName"/>
                            <form:errors class="error-class" path="user.lastName"/>
                        </div>
                    </div>
                </div>
                <div class="row row-space">
                    <div class="col-2">
                        <div class="input-group">
                            <form:label class="form-label label" path="player.position">Position:</form:label>
                            <form:input class="form-control input--style-4" path="player.position" />
                            <form:errors class="error-class" path="player.position"/>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="input-group">
                            <form:label class="form-labe label" path="player.skills">Skills:</form:label>
                            <form:input class="form-control input--style-4" path="player.skills"/>
                            <form:errors class="error-class" path="player.skills"/>
                        </div>
                    </div>
                </div>

                <div class="row row-space">
                    <div class="col-2">

                    </div>
                </div>
                <div class="row row-space">
                    <div class="col-2">
                        <div class="input-group">
                            <form:label class="form-label label" path="player.marketValue">Market Value:</form:label>
                            <form:input type="number " class="form-control input--style-4" path="player.marketValue" />
                            <form:errors class="error-class" path="player.marketValue"/>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="input-group">
                            <label class="form-label label">Upload profile picture: </label>
                            <input type="file" name="file" accept=".jpeg, .png, .jpg">
                        </div>
                    </div>
                </div>

        <form:hidden path="user.id" value="${user.id}"/>

                <div class="buttons" >
                    <button class="btn btn--radius-2 btn--blue" type="submit">Update</button>
                    <a class="div btn btn--radius-2" id="btn-red" href="../playerDashboard">Cancel</a>
                </div>

        </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>