package com.example.webs12.service;

import com.example.webs12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUser();
    public  boolean deleteUser(int id);
    public boolean updateUser(User user) throws SQLException;
    public List<User> arrange() throws SQLException;
    List<User> searchByCountry(String country) throws SQLException;
}
