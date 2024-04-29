package org.example.countrycrud.district;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.District;
import org.example.repo.DistrictRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(value = "/district/delete")
public class DeleteDistrictServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UUID districtId = UUID.fromString(req.getParameter("id"));

        DistrictRepo.delete(districtId);


        resp.sendRedirect("/admin/district.jsp");
    }
}
