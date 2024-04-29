<%@ page import="java.util.List" %>
<%@ page import="org.example.entity.Region" %>
<%@ page import="org.example.repo.RegionRepo" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.example.entity.District" %>
<%@ page import="org.example.repo.DistrictRepo" %>
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.repo.CountryRepo" %>
<%@ page import="org.example.entity.Country" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        List<Region> regions=RegionRepo.getAll();
        boolean isEditing=false;
        if (request.getParameter("isEditing")!=null) {
            isEditing=Boolean.parseBoolean(request.getParameter("isEditing"));
        }
        District district=null;
        Region region1;
        Country country1=null;
        if (request.getParameter("id")!=null) {
            isEditing=true;
            district= DistrictRepo.getById(UUID.fromString(request.getParameter("id")));
            region1=RegionRepo.getById(district.getRegionId());
            country1=CountryRepo.getById(region1.getCountryId());
        }

        List<Country> countries = CountryRepo.getAll();


    %>
    <title><%=isEditing?"Edit District":"Add District"%></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.css">

</head>
<body>

<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <%=isEditing?"Edit District":"Add District"%>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/add/add_district.jsp" method="POST">
                <div class="form-group">
                    <label >District Name</label>
                    <%if (isEditing) {%>
                    <input type="hidden" name="id" value=<%=district.getId()%>>
                    <%}%>
                    <input type="hidden" name="isEditing" value=<%=isEditing%>>
                    <label>
                        <input type="text" class="form-control" name="name" required value=<%=isEditing?district.getName():""%>  >
                    </label>
                </div>

                <div class="form-group">
                    <label for="country">Country:</label>
                    <select class="form-control" id="country" name="countryId">
                        <%
                            if (isEditing) {
                                %>
                        <option value=<%=country1.getId()%>><%=country1.getName()%></option><%
                            }else {
                                %>
                        <option value="">Select Country</option>
                        <%
                            }
                        %>



                        <% for (Country country : countries) {
                            if (Objects.equals(country, country1)) continue;
                        %>
                        <option value="<%= country.getId() %>"><%= country.getName() %></option>
                        <% } %>
                    </select>
                    <button type="submit" class="btn btn-primary"> OK </button>

<%--                    <label for="region">Region:</label>--%>
<%--                    <select class="form-control" id="region" name="regionId">--%>
<%--                        <%if (isEditing) {%>--%>
<%--                        <option value=<%=region1.getId()%>><%=region1.getName()%></option>--%>
<%--                        <%}else {%>--%>

<%--                        <option value="">Select Region</option>--%>
<%--                        <%}%>--%>
<%--                        <% for (Region region : regions) {--%>
<%--                        if (Objects.equals(region, region1)) continue;--%>
<%--                        %>--%>
<%--                        <option value="<%= region.getId() %>"><%= region.getName() %></option>--%>
<%--                        <% } %>--%>
<%--                    </select>--%>


                </div>
<%--                <button type="submit" class="btn btn-primary">Submit</button>--%>
            </form>
        </div>
    </div>
</div>
</body>
</html>
