<%@ page import="org.example.entity.Country" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.example.repo.CountryRepo" %><%--
  Created by IntelliJ IDEA.
  User: OSIYOcomputers
  Date: 25.04.2024
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Country</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.css">
</head>
<body><%
    boolean isEditing=false;
    Country country=null;
    if (request.getParameter("id")!=null) {
        isEditing=true;
        UUID countryId=UUID.fromString(request.getParameter("id"));
        country = CountryRepo.getById(countryId);
    }
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    Country
                </div>
                <div class="card-body">
                    <form action=<%=isEditing?"/country/edit":"/country/add"%> method="POST">
                        <div class="form-group">
                            <%
                            if(isEditing){
                            %>
                            <input type="hidden" name="countryId" value=<%=country.getId()%>>
                            <%}%>
                            <label>Country Name</label>
                            <label>
                                <input type="text" class="form-control"  name="name" required value=<%=isEditing?country.getName():""%>>
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
