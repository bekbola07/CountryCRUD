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

@WebServlet(value = "/country/edit")
public class EditCountryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UUID countryId = UUID.fromString(req.getParameter("countryId"));

        Country country = Country.builder()
                .name(req.getParameter("name")).build();
        CountryRepo.edit(countryId,country);

        resp.sendRedirect("/admin/country.jsp");
    }
}
