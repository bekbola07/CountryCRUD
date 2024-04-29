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

@WebServlet(value = "/district/edit")
public class EditDistrictServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        District district = District.builder()
                .regionId(UUID.fromString(req.getParameter("regionId")))
                .name(req.getParameter("name"))
                .build();

        UUID districtId = UUID.fromString(req.getParameter("id"));

        DistrictRepo.edit(districtId,district);


        resp.sendRedirect("/admin/district.jsp");

    }
}
