package org.example.countrycrud.country;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.repo.CountryRepo;

import java.io.IOException;

@WebServlet(value = "/country/add")
public class AddCountryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CountryRepo.addCountry(req.getParameter("name"));
        resp.sendRedirect("/admin/country.jsp");
    }
}
