<%@ page import="java.util.List" %>
<%@ page import="org.example.dto.RegionDTO" %>
<%@ page import="org.example.repo.RegionRepo" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Region</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.css">
</head>
<body>
<%
List<RegionDTO> regionDTOs= RegionRepo.getAllWithCountry();
    int id=1;

    %>
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
            <div class="col-9">
                <div class="container">
                    <h1>Region</h1>
                    <table class="table region-table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Region Name</th>
                            <th>Country</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for (RegionDTO region : regionDTOs) { %>
                        <tr>
                            <td><%= id++ %></td>
                            <td><%= region.name() %></td>
                            <td><%= region.country() %></td>
                            <td>
                                <a href="/admin/add/region.jsp?id=<%= region.id() %>" class="btn btn-primary btn-sm">Edit</a>
                                <form action="/region/delete" style="display: inline;">
                                    <input type="hidden" name="id" value="<%= region.id() %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="col-3">
                <a class="btn btn-dark" href="/admin/add/region.jsp">Add Region</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
