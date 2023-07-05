package com.example.webs12.repository;

import com.example.webs12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUser();
    public  boolean deleteUser(int id);
    public boolean updateUser(User user) throws SQLException;
    public List<User> arrange() throws SQLException;
    public List<User> findByCountry(String country) throws SQLException;
}
