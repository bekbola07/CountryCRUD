<%@ page import="org.example.entity.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.repo.CountryRepo" %>
<%@ page import="org.example.repo.RegionRepo" %>
<%@ page import="org.example.entity.Region" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="static/bootstrap.css">
</head>
<body>

<div class="row">
    <div class="col-3 bg-dark text-white p-4" style="min-height: 100vh">
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
                                    <a class="btn text-dark" href="/region.jsp?id=<%=region.getId()%>">
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