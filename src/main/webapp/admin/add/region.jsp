<%@ page import="org.example.entity.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.repo.CountryRepo" %>
<%@ page import="org.example.entity.Region" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.example.repo.RegionRepo" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 23.04.2024
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Region</title>
    <link rel="stylesheet" href="../../static/bootstrap.css">
</head>
<body>
<%
    boolean isEditing=false;
    Region region =null;
    Country country1=null;
    if (request.getParameter("id")!=null) {
        isEditing=true;
        UUID regionId= UUID.fromString(request.getParameter("id"));
        region = RegionRepo.getById(regionId);
        country1 =CountryRepo.getById(region.getCountryId());
    }
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Add Region
                </div>
                <div class="card-body">
                    <form action=<%=isEditing?"/region/edit":"/region/add"%> method="POST">
                        <div class="form-group">
                            <%if (isEditing) {%>
                            <input type="hidden" name="id" value=<%=region.getId()%>>
                            <%}%>
                            <label >Region Name</label>
                            <label>
                                <input type="text" class="form-control"  name="name" required value=<%=isEditing?region.getName():""%>>
                            </label>

                        </div>

                        <div class="form-group">
                            <label >Country</label>
                            <label>
                                <select class="form-control" name="countryId" required>
                                    <%
                                        if (isEditing) {
                                            %>
                                    <option value=<%=country1.getId()%>><%=country1.getName()%></option>

                                    <%
                                        }else {
                                            %>
                                    <option value="">Select a country</option>

                                    <%
                                        }
                                    %>
                                    <%
                                        List<Country> countries = CountryRepo.getAll();
                                        for (Country country : countries) {
                                            if (Objects.equals(country, country1)) continue;
                                    %>
                                    <option value="<%= country.getId() %>"><%= country.getName() %></option>
                                    <% } %>
                                </select>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
