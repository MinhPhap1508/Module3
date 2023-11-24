package com.example.demo.service;

import com.example.demo.model.Cash;

import java.util.List;

public interface ICashService {
    List<Cash> displayAll();
    void addCash(Cash cash);
    void deleteCash(int id);
}
