package com.example.java_web.service;

import com.example.java_web.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showProduct();

    void addProduct(String name, double price, String description, String producer);

    Product findById(int id);

    void updateProduct(int id, Product product);

    void removeProduct(int id);
    List<Product> searchProduct(String name);
}
