package org.example.countrycrud.region;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Region;
import org.example.repo.RegionRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(value = "/region/add")
public class AddRegionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Region region = Region.builder()
                .countryId(UUID.fromString(req.getParameter("countryId")))
                .name(req.getParameter("name"))
                .build();

        RegionRepo.add(region);

        resp.sendRedirect("/admin/region.jsp");
    }
}
