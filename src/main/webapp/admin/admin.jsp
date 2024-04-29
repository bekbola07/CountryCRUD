<%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="/static/bootstrap.css">
</head>
<body>
<div class="row">
    <div class="col-3 bg-dark text-white p-4" style="height: 100vh">
        <a href="/admin/country.jsp">
            <li class="list-group-item text-dark">Country</li>
        </a>
        <a href="/admin/region.jsp">
            <li class="list-group-item text-dark">Region</li>
        </a>
        <a href="/admin/district.jsp">
            <li class="list-group-item text-dark">District</li>
        </a>


    </div>
    <div class="col-9">
        <div class="row">
            <div class="col-9"></div>
            <div class="col-3">
                <a class="btn btn-dark" href="/admin/admin.jsp">Admin</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
