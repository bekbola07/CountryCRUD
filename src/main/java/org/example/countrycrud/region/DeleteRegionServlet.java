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

@WebServlet(value = "/region/delete")
public class DeleteRegionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UUID regionId = UUID.fromString(req.getParameter("id"));

        RegionRepo.delete(regionId);

        resp.sendRedirect("/admin/region.jsp");
    }
}
