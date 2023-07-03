package com.example.java_web.service;

import com.example.java_web.model.Product;
import com.example.java_web.repository.IProductRepository;
import com.example.java_web.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showProduct() {
        return productRepository.showProduct();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productRepository.updateProduct(id, product);
    }

    @Override
    public void removeProduct(int id) {
        productRepository.removeProduct(id);
    }

    @Override
    public void searchProduct(String name) {
        productRepository.getByName(name);
    }


}
