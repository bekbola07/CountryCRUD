package org.example.repo;

import org.example.config.CPM;
import org.example.dto.RegionDTO;
import org.example.entity.Region;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class RegionRepo {
    public static void add(Region region) {
        String query ="insert into region (name, country_id) VALUES (?,?)";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,region.getName());
            preparedStatement.setObject(2,region.getCountryId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Region> getAll() {
        String query ="select *from region order by create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<Region> regions = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                regions.add(Region.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .countryId(UUID.fromString(resultSet.getString("country_id")))
                        .build());
            }
            return regions;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static Region getById(UUID id) {
        String query ="select *from region where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<Region> regions = new ArrayList<>();
            preparedStatement.setObject(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                regions.add(Region.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .countryId(UUID.fromString(resultSet.getString("country_id")))
                        .build());
            }
            return regions.get(0);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void edit(UUID id,Region region) {
        String query ="update region set name=?, country_id=? where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,region.getName());
            preparedStatement.setObject(2   ,region.getCountryId());
            preparedStatement.setObject(3   ,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void delete(UUID id) {
        String query ="delete from region where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static List<Region> getByCountry(UUID countryId) {
        String query ="select *from region where country_id=? order by create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<Region> regions = new ArrayList<>();
            preparedStatement.setObject(1,countryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                regions.add(Region.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .countryId(UUID.fromString(resultSet.getString("country_id")))
                        .build());
            }
            return regions;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static List<RegionDTO> getAllWithCountry() {
        String query ="select r.id as id,\n" +
                "       r.name as name,\n" +
                "       c.name as country\n" +
                "from country c\n" +
                "         join public.region r on c.id = r.country_id order by r.create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<RegionDTO> regionDTOS = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                regionDTOS.add(RegionDTO.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .country((resultSet.getString("country")))
                        .build());
            }
            return regionDTOS;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
