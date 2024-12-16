<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- for Bootstrap CSS -->
<%--    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>

<%--    <!-- For any Bootstrap that uses JS or jQuery-->--%>
<%--    <script src="/webjars/jquery/jquery.min.js"></script>--%>
<%--    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>--%>
    <title>Login Page</title>

    <link href="/css/main.css" rel="stylesheet" media="all">
</head>
<body>


<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4" id="card">
            <div class="card-body" id="card-text">
                <h2 class="title">Login</h2>

                <form method="POST" action="/login">
                    <c:if test="${logoutMessage != null}">
                        <p class="text-success">${logoutMessage}</p>
                    </c:if>


                    <div class="row row-space">
<%--                        <div class="col-2">--%>
                            <div class="input-group">
<%--                                <form:label class="form-label label" path="user.email">Email:</form:label>--%>
<%--                                <form:input class="form-control input--style-4" path="user.email"/>--%>
<%--                                <form:errors class="text-danger input--style-4" path="user.email"/>--%>
                                <label for="email" class="form-label label">Email</label>
                                <input type="text" class="input--style-4" id="email" required="" name="email"/>
<%--                            </div>--%>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="input-group">
                            <label for="password" class="form-label label">Password</label>
                            <input type="password" class="input--style-4" id="password" required=""  name="password"/>
<%--                            <form:label class="form-label label  " path="user.password">Password:</form:label>--%>
<%--                            <form:password class="form-control  input--style-4" path="user.password" />--%>
<%--                            <form:errors class="text-danger  input--style-4" path="user.password"/>--%>
                        </div>
                        </div>
<%--                    <p>--%>
<%--                        <label for="email">Email</label>--%>
<%--                        <input type="text" class="form-control" id="email" required="" name="email"/>--%>
<%--                    </p>--%>
<%--                    <p>--%>
<%--                        <label for="password">Password</label>--%>
<%--                        <input type="password" class="form-control" id="password" required=""  name="password"/>--%>
<%--                    </p>--%>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<%--                    <button type="submit" class="btn btn-primary ">Login</button>--%>
                    <div class="p-t-15">
                        <button class="btn btn--radius-2 btn--blue" type="submit">Login</button>
                    </div>
                    <c:if test="${errorMessage != null}">
                        <p class="text-danger">${errorMessage}</p>
                    </c:if>


                    <div class="p-t-15">
                       <p> Don't have an account? <a href="/registration"
                                                     class="link">Register Instead</a></p> </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




</body>
</html>