package com.vdp.users.service;


import com.vdp.users.dao.CategoryDAO;
import com.vdp.users.dao.ProductsDAO;
import com.vdp.users.dao.UserDao;
import com.vdp.users.model.Category;
import com.vdp.users.model.Products;
import com.vdp.users.model.User;
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

    //admin part---------------------------------------
    @Transactional
    public void deleteOneProduct(Products product){
        productsDAO.deleteOne(product);
    }

    @Transactional
    public void deleteManyProducts(long [] toDelete){
        productsDAO.deleteMany(toDelete);
    }

    @Transactional
    public void addProduct(Products product){
        productsDAO.addProduct(product);
    }

    @Transactional
    public  List <Products> displayProducts(){
      return   productsDAO.listall();
    }



     // end of admin part---------------------------------------

    @Transactional(readOnly = true)
    public com.vdp.users.model.User findUserByUsername(String username){
        User user = userDao.findByUserName(username);
        return user;
    }

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
}
