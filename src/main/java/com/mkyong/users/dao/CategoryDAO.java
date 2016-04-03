package com.mkyong.users.dao;

import com.mkyong.users.model.Category;

import java.util.List;

public interface CategoryDAO {
    Category showOne(long id);
    List<Category> list();
}
