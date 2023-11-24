package com.example.demo.repository;

import com.example.demo.model.Cash;

import java.util.List;

public interface ICashRepository {
    List<Cash> displayAll();
    void addCash(Cash cash);
    void deleteCash(int id);
}
