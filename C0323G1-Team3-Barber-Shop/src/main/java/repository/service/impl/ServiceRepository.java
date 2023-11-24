package repository.service.impl;

import model.Service;
import repository.service.BaseRepository;
import repository.service.IServiceRepository;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class ServiceRepository implements IServiceRepository {
    private static final String SELECT_SERVICE_ALL = "select * from service";
    private static final String SELECT_SERVICE_BY_ID = " select * from service where service_id=? ";
    private static final String DELETE_SERVICE = "delete from service where service_id=?";
    private static final String CALL_INSERT_SERVICE = " call insert_service(?, ? ); ";
    private static final String CALL_UPDATES_SERVICE = " call update_service(?, ?, ?; ";

    @Override
    public List<Service> displayAll() {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICE_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("service_id");
                String name = rs.getString("service_name");
                double price = rs.getDouble("price");
                serviceList.add(new Service(id, name, price));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return serviceList;
    }

    @Override
    public void addService(Service service) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(CALL_INSERT_SERVICE);
            callableStatement.setString(1, service.getServiceName());
            callableStatement.setDouble(2, service.getPrice());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean updateService(Service service) {
        boolean rowUpdates;
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(CALL_UPDATES_SERVICE);
            callableStatement.setString(1, service.getServiceName());
            callableStatement.setDouble(2, service.getPrice());
            callableStatement.setInt(3, service.getServiceId());
            rowUpdates = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdates;
    }

    @Override
    public boolean deleteService(int id) {
        boolean rowDelete;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SERVICE);
            preparedStatement.setInt(1, id);
            rowDelete=preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    @Override
    public Service getById(int id) {
        Service service = null;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(SELECT_SERVICE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("service_name");
                double price = rs.getDouble("price");
                service = new Service(id, name, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }


}
