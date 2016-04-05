package com.mkyong.users.model;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "category")
public class Category {
    @Id
    @Column(name = "id")
    private long id;

    public Category() {
    }

    public Category(String category_name) {
        this.category_name = category_name;
    }

    @Column (name = "category_name")
    private String category_name;

    @ManyToMany(mappedBy = "categories")
    private List<Products> products = new ArrayList<Products>();

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getCategory_name() {
        return category_name;
    }
}
