package com.example.webs12.service;

import com.example.webs12.model.User;
import com.example.webs12.repository.IUserRepository;
import com.example.webs12.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private static IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();

    }
    // tại sao trong service lại gọi service? repo đâu?

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> arrange() throws SQLException {
        return userRepository.arrange();
    }

    @Override
    public List<User> searchByCountry(String country) throws SQLException {
        return userRepository.findByCountry(country);
    }
}
