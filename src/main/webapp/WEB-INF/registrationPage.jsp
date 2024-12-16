<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html >
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/global.js"></script>

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">

    <title>Registration Page</title>
</head>
<body >
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4" id="register_card">
            <div class="card-body" id="card-text">
                <h2 class="title">Registration Form</h2>
                <%--@elvariable id="myModel" type="java"--%>
                <form:form method="POST" action="/registration" modelAttribute="myModel" enctype="multipart/form-data">
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
                                <form:label class="form-label label" path="user.email">Email:</form:label>
                                <form:input class="form-control input--style-4" path="user.email"/>
                                <form:errors class="error-class" path="user.email"/>
                            </div>
                        </div>
                        <div class="col-2">
                                <div class="input-group">
                                    <form:label class="form-label label  " path="user.password">Password:</form:label>
                                    <form:password class="form-control  input--style-4" path="user.password" />
                                    <form:errors class="error-class" path="user.password"/>
                                </div>
                        </div>
                    </div>

                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <form:label class="form-label label" path="user.passwordConfirmation">Password Confirmation:</form:label>
                                <form:password class="form-control input--style-4" path="user.passwordConfirmation" />
                                <form:errors class="error-class" path="user.passwordConfirmation"/>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <form:label class="form-label label" path="player.position">Position:</form:label>
                                <form:input class="form-control input--style-4" path="player.position" />
                                <form:errors class="error-class" path="player.position"/>
                            </div>
                        </div>
                    </div>

                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <form:label class="form-labe label" path="player.skills">Skills:</form:label>
                                <form:input class="form-control input--style-4" path="player.skills" placeholder=".. PAC .. DRI .. SHO .. DEF .. PAS .. PHY"/>
                                <form:errors class="error-class" path="player.skills"/>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <form:label class="form-label label" path="player.dob">Date of Birth:</form:label>
                                <form:input type="date" class="form-control input--style-4" path="player.dob" id="dob" />
                                <form:errors class="error-class" path="player.dob"/>
                            </div>
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
                    <div class="p-t-15">
                        <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                    </div>
                    <div class="p-t-15">
                        <p>Already have an account? <a href="/login"
                                                      class="link">Login</a></p> </p>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    // dob.max = new Date().toISOString().split("T")[0];
    document.getElementById('dob').max=new Date().toISOString().split("T")[0];
</script>
</body>
</html>