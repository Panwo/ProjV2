package com.mkyong.users.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "products")
public class Products implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idProducts")
    private long id;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private String price;

    @Column(name = "image")
    private byte [] image;

    public Products() {
    }

    public Products(String description, String price, byte[] image) {
        this.description = description;
        this.price = price;
        this.image = image;
    }


    @ManyToMany
    @JoinTable(
       name = "category_products",
            joinColumns ={@JoinColumn (name = "Products_idProducts", referencedColumnName = "idProducts")},
            inverseJoinColumns = {@JoinColumn(name = "category_id", referencedColumnName = "id")}
    )
        List<Category> categories = new ArrayList<Category>();

    @ManyToMany
    @JoinTable(
            name = "users_product",
            joinColumns ={@JoinColumn (name = "Products_idProducts", referencedColumnName = "idProducts")},
            inverseJoinColumns = {@JoinColumn(name = "users_username", referencedColumnName = "username")}
    )
      List<User> usersList = new ArrayList<User>();


    public void setId(long id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public long getId() {
        return id;
    }

    public String getPrice() {
        return price;
    }

    public byte[] getImage() {
        return image;
    }
}
