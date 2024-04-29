<%@ page import="org.example.entity.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.repo.CountryRepo" %>
<%@ page import="org.example.entity.Region" %>
<%@ page import="org.example.repo.RegionRepo" %>
<%@ page import="org.example.dto.DistrictDTO" %>
<%@ page import="org.example.repo.DistrictRepo" %>
<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>District</title>
    <link rel="stylesheet" href="static/bootstrap.css">
</head>
<body>
<div class="row">
    <div class="col-3 bg-dark text-white p-4" style="height: 100vh">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <ul class="list-group text-dark">
                        <% int i=1;
                            List<Country> countries = CountryRepo.getAll();
                            for (Country country: countries) {
                        %>

                        <li class="list-group-item" data-toggle="collapse" data-target="#item<%=i++%>"><%=country.getName()%></li>
                        <div id="item<%=i-1%>" class="collapse">
                            <ul class="list-group ml-3">
                                <%  List<Region> regions = RegionRepo.getByCountry(country.getId());
                                    for (Region region : regions) {
                                %>
                                <li class="list-group-item">
                                    <a class="btn" href="/region.jsp?id=<%=region.getId()%>">
                                        <%=region.getName()%>
                                    </a>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>

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

                    </tr>
                    </thead>
                    <tbody><%
                        List<DistrictDTO> districtDTOS = DistrictRepo.getAllWithRegionByRegion(UUID.fromString(request.getParameter("id")));
                        int id=1;
                    %>
                    <% for (DistrictDTO district : districtDTOS) { %>
                    <tr>
                        <td><%= id++ %></td>
                        <td><%= district.name() %></td>
                        <td><%= district.country() %></td>
                        <td><%= district.region() %></td>

                    </tr>
                    <% } %>
                    </tbody>
                </table>


                <!-- Bootstrap JS -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            </div>
            <div class="col-3">
                <a class="btn btn-dark" href="admin/admin.jsp">admin</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
