package org.example.repo;

import org.example.config.CPM;
import org.example.dto.DistrictDTO;
import org.example.entity.District;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class DistrictRepo {
    public static void add(District district) {
        String query ="insert into district (name, region_id) VALUES (?,?)";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,district.getName());
            preparedStatement.setObject(2,district.getRegionId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<District> getAll() {
        String query ="select *from district order by create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<District> districts = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                districts.add(District.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .regionId(UUID.fromString(resultSet.getString("region_id")))
                        .build());
            }
            return districts;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static District getById(UUID id) {
        String query ="select *from district where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<District> districts = new ArrayList<>();
            preparedStatement.setObject(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                districts.add(District.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .regionId(UUID.fromString(resultSet.getString("region_id")))
                        .build());
            }
            return districts.get(0);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void edit(UUID id,District district) {
        String query ="update district set name=?, region_id=? where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,district.getName());
            preparedStatement.setObject(2   ,district.getRegionId());
            preparedStatement.setObject(3   ,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void delete(UUID id) {
        String query ="delete from district where id=?";
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

    public static List<District> getByRegion(UUID regionId) {
        String query ="select *from district where region_id=? order by create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<District> districts = new ArrayList<>();
            preparedStatement.setObject(1,regionId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                districts.add(District.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .regionId(UUID.fromString(resultSet.getString("region_id")))
                        .build());
            }
            return districts;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public static List<DistrictDTO> getDistrictWithRegion(){
        String query = """
                select d.id as id,
                       d.name as name,
                       r.name as region,
                       c.name as country
                from district d
                         join public.region r on r.id = d.region_id
                         join public.country c on c.id = r.country_id
                         order by d.create_at""";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<DistrictDTO> districtDTOS =new ArrayList<>();

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                districtDTOS.add(new DistrictDTO(
                        UUID.fromString(resultSet.getString("id")),
                        resultSet.getString("name"),
                        resultSet.getString("country"),
                        resultSet.getString("region")
                ));
            }
            return districtDTOS;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static List<DistrictDTO> getAllWithRegionByRegion(UUID regionId){
        String query = """
                select d.id as id,
                       d.name as name,
                       r.name as region,
                       c.name as country
                from district d
                         join public.region r on r.id = d.region_id
                         join public.country c on c.id = r.country_id where r.id=?
                         order by d.create_at""";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<DistrictDTO> districtDTOS =new ArrayList<>();
            preparedStatement.setObject(1,regionId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                districtDTOS.add(new DistrictDTO(
                        UUID.fromString(resultSet.getString("id")),
                        resultSet.getString("name"),
                        resultSet.getString("country"),
                        resultSet.getString("region")
                ));
            }
            return districtDTOS;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
