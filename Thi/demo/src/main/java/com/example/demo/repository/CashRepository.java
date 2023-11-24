package com.example.demo.repository;

import com.example.demo.model.Cash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CashRepository implements ICashRepository {
    private static final String SELECT_ALL_CASH = " select * from cash ";
    private static final String DELETE_CASH = " delete from cash where id = ? ";
    private static final String INSERT_INTO_CASH = " insert into cash(`name`,choose, `date`, price, `description`) values (?, ?, ?, ?, ?) ";

    @Override
    public List<Cash> displayAll() {
        List<Cash> cashList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CASH);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                boolean choose = rs.getBoolean("choose");
                String date = rs.getString("date");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                Cash cash = new Cash(id, name, choose, date, price, description);
                cashList.add(cash);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cashList;
    }

    @Override
    public void addCash(Cash cash) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CASH);
            preparedStatement.setString(1, cash.getName());
            preparedStatement.setBoolean(2, cash.isChoose());
            preparedStatement.setString(3, cash.getDate());
            preparedStatement.setDouble(4, cash.getPrice());
            preparedStatement.setString(5, cash.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteCash(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CASH);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
