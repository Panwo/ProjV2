package com.vdp.users.model;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {

    @Id
    @Column (name = "id")
    private long id;


    @Column (name = "amount")
    private Integer amount;

    @Column(name = "name")
    private String name;

    @Column(name= "list")
    private String list;

    public Orders() {}

    public Orders(Integer amount) {
        this.amount = amount;

    }

    public Orders(Integer amount, String name, String list) {
        this.amount = amount;
        this.name = name;
        this.list = list;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getList() {
        return list;
    }

    public void setList(String list) {
        this.list = list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
