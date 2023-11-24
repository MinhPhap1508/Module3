package com.example.java_web.repository;

import com.example.java_web.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1, "Boeing 747", 9999999, "Sản phẩm nhập khẩu 100%", "USA"));
        productMap.put(2, new Product(2, "Airbus", 94645646, "Sản phẩm nhập khẩu 100%", "France"));
        productMap.put(3, new Product(3, "Embraer", 3525999, "Sản phẩm dựng lại", "Brazil"));
    }

    @Override
    public List<Product> showProduct() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> searchProduct(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product p : showProduct()) {
            if (p.getName().contains(name)){
                productList.add(p);
            }
        }
        return productList;
    }


    @Override
    public void addProduct(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void removeProduct(int id) {
        productMap.remove(id);
    }
}
