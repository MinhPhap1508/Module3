package com.example.webs12.repository;

import com.example.webs12.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String ORDER_USER_BY_NAME = "select * from users order by name";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String CALL_SELECT_ALL = "call select_all()";
    private static final String CALL_UPDATES_USER = "call update_user(?, ?, ?, ?)";
    private static final String CALL_DELETE_USER = "call delete_user(?)";

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();


    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }



    @Override
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(CALL_SELECT_ALL);
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    //CALL DELETE

    //END
    @Override
    public boolean deleteUser(int id) {
        boolean rowDelete;
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement;
        try {
            callableStatement = connection.prepareCall(CALL_DELETE_USER);
            callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    //CALL UPDATES


    //END

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement;

        callableStatement = connection.prepareCall(CALL_UPDATES_USER);

        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        callableStatement.setInt(4, user.getId());
        rowUpdate = callableStatement.executeUpdate() > 0;
        return rowUpdate;
    }

    @Override
    public List<User> arrange() throws SQLException {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(ORDER_USER_BY_NAME);
        while (rs.next()) {
            userList.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("country")));
        }
        return userList;
    }

    @Override
    public List<User> findByCountry(String country) throws SQLException {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
        preparedStatement.setString(1, "%" + country + "%");
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            userList.add(new User(name, email, country));
        }
        connection.close();
        return userList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
