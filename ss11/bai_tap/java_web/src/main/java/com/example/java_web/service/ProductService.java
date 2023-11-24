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
    public void addProduct(String name, double price, String description, String producer) {
        int id;
        for (id = 1; id <=productRepository.showProduct().size()+1 ; id++) {
            Product product = productRepository.findById(id);
            if(product==null)
                break;
        }
        productRepository.addProduct(new Product(id, name, price,description, producer));
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
    public List<Product> searchProduct(String name) {
        return productRepository.searchProduct(name);
    }


}
