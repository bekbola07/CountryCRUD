package org.example.countrycrud.country;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Country;
import org.example.repo.CountryRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(value = "/country/delete")
public class DeleteCountryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UUID countryId = UUID.fromString(req.getParameter("id"));

        CountryRepo.delete(countryId);


        resp.sendRedirect("/admin/country.jsp");
    }
}
