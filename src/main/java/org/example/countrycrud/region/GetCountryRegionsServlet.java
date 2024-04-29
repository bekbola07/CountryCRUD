package org.example.countrycrud.region;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.entity.Region;
import org.example.repo.RegionRepo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

@WebServlet(value = "/regions")
public class GetCountryRegionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        List<Region> regions = RegionRepo.getByCountry(UUID.fromString(req.getParameter("countryId")));

        Gson gson = new Gson();
        String jsonRegions = gson.toJson(regions);
        System.out.println("dfv");

        // Set response content type to JSON
        resp.setContentType("application/json");

        // Write the JSON data to the response
        PrintWriter out = resp.getWriter();
        out.print(jsonRegions);
        out.flush();
    }
}
