package com.vdp.users.dao;
import com.vdp.users.model.Category;
import com.vdp.users.model.Products;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class ProductsDAOImpl implements  ProductsDAO  {

    @PersistenceContext
    private EntityManager entityManager;


//user ------------------------------------------------------------------
    @Override
    public List<Products> list (Category category) {
        Query query;
        query = entityManager.createQuery("select  p from Products p join p.categories c where  c.id = :idCategory", Products.class);
        query.setParameter("idCategory", category.getId());

        return (List<Products>) query.getResultList();
    }
    //-----------------------------------------------------------------------



    // admin otions ----------------------------------------------------------
    @Override
    public  void deleteOne(Products product){
        entityManager.remove(product);
    }


    @Override
    public void deleteMany(long [] toDelete){
       Products product;
        for (long l : toDelete) {
            product = entityManager.getReference(Products.class, l);
            entityManager.remove(product);
        }
    }


    @Override
    public  void addProduct(Products product){
        entityManager.persist(product);
    }


    @Override
    public List<Products> listall(){
        Query query;
        query = entityManager.createQuery("select p From Products p");
        return( List<Products>) query.getResultList();

    }

    //------------------------------------------------------------------------
}
