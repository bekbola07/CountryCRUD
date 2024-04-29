<%@ page import="org.example.entity.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.repo.CountryRepo" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Country</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.css">
</head>
<body>
<div class="row">
    <div class="col-3 bg-dark text-white p-4" style="height: 100vh">
        <a href="${pageContext.request.contextPath}/admin/country.jsp">
            <li class="list-group-item text-dark">Country</li>
        </a>
        <a href="${pageContext.request.contextPath}/admin/region.jsp">
            <li class="list-group-item text-dark">Region</li>
        </a>
        <a href="${pageContext.request.contextPath}/admin/district.jsp">
            <li class="list-group-item text-dark">District</li>
        </a>


    </div>
    <div class="col-9">
        <div class="row">
            <div class="col-9">
                <h1 class="h1 p-3">Country</h1>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>T/r</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Country> countries = CountryRepo.getAll();
                        int i=1;
                        for (Country country : countries) {
                    %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= country.getName() %></td>
                        <td>
                            <a href="/admin/add/country.jsp?id=<%= country.getId() %> " class="btn btn-primary">Edit</a>
                            <a href="/country/delete?id=<%= country.getId() %>" class="btn btn-danger">Delete</a>

                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>
            <div class="col-3">
                <a class="btn btn-dark" href="/admin/add/country.jsp">Add Country</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
