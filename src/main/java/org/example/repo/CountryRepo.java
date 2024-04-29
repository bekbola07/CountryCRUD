package org.example.repo;

import org.example.config.CPM;
import org.example.dto.RegionDTO;
import org.example.entity.Country;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CountryRepo {
    public static void addCountry(String name) {
        String query ="insert into country(name) values (?)";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,name);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Country> getAll() {
        String query ="select *from country order by create_at";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<Country> categories = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                categories.add(Country.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .build());
            }
            return categories;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void delete(UUID id) {
        String query ="delete from country where id=?";
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

    public static Country getById(UUID id) {
        String query ="select *from country where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            List<Country> categories = new ArrayList<>();
            preparedStatement.setObject(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                categories.add(Country.builder()
                        .id(UUID.fromString(resultSet.getString("id")))
                        .name(resultSet.getString("name"))
                        .build());
            }
            return categories.get(0);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void edit(UUID id, Country country) {
        String query ="update country set name=? where id=?";
        try (
                Connection connection = CPM.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setObject(1,country.getName());
            preparedStatement.setObject(2   ,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
