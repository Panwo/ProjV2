package com.mkyong.users.dao;

import com.mkyong.users.model.Category;
import com.mkyong.users.model.Products;

import java.util.List;

public interface ProductsDAO {
    List<Products> list (Category category);
}
