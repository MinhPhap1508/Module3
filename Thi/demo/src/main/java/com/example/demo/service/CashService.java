package com.example.demo.service;

import com.example.demo.model.Cash;
import com.example.demo.repository.CashRepository;
import com.example.demo.repository.ICashRepository;

import java.util.List;

public class CashService implements ICashService {
    private static ICashRepository cashRepository = new CashRepository();

    @Override
    public List<Cash> displayAll() {
        return cashRepository.displayAll();
    }

    @Override
    public void addCash(Cash cash) {
        cashRepository.addCash(cash);
    }

    @Override
    public void deleteCash(int id) {
        cashRepository.deleteCash(id);
    }
}
