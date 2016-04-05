package com.mkyong.users.service;


import com.mkyong.users.dao.CategoryDAO;
import com.mkyong.users.dao.ProductsDAO;
import com.mkyong.users.dao.UserDao;
import com.mkyong.users.model.Category;
import com.mkyong.users.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MyService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private ProductsDAO productsDAO;

    @Transactional(readOnly =  true)
    public Category find(long id ){
        return categoryDAO.showOne(id);
    }

    @Transactional(readOnly=true)
    public List<Category> listGroups() {
        return categoryDAO.list();
    }
    @Transactional(readOnly = true)
    public  List<Products> listProducts (Category category){
        return productsDAO.list(category);
    }

    @Transactional(readOnly = true)
    public com.mkyong.users.model.User findUserByUsername(String username){
        com.mkyong.users.model.User user = userDao.findByUserName(username);
        return user;
    }
}
