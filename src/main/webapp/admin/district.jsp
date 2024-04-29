<%@ page import="org.example.dto.DistrictDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.repo.DistrictRepo" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>District</title>
    <link rel="stylesheet" href="/static/bootstrap.css">
</head>
<body>
<%
    List<DistrictDTO> districtDTOS = DistrictRepo.getDistrictWithRegion();
    int id=1;
%>
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
                <h1>District</h1>
                <table class="table district-table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>District Name</th>
                        <th>Country</th>
                        <th>Region</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (DistrictDTO district : districtDTOS) { %>
                    <tr>
                        <td><%= id++ %></td>
                        <td><%= district.name() %></td>
                        <td><%= district.country() %></td>
                        <td><%= district.region() %></td>
                        <td>
                            <a href="/admin/add/district.jsp?id=<%= district.id() %>" class="btn btn-primary btn-sm">Edit</a>
                            <form action="/district/delete" style="display: inline;">
                                <input type="hidden" name="id" value="<%= district.id() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-3">
                <a class="btn btn-dark" href="/admin/add/district.jsp">Add District</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
