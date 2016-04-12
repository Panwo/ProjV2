package com.vdp.users.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {

	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;
	@Column(name = "password", nullable = false, length = 60)
	private String password;
	@Column(name = "enabled", nullable = false)
	private boolean enabled;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade=CascadeType.ALL)
	private Set<UserRole> userRole = new HashSet<UserRole>(0);

	@ManyToMany
	@JoinTable(
 			name = "users_product",
			joinColumns ={@JoinColumn (name = "users_username",  referencedColumnName = "username")},
			inverseJoinColumns = {@JoinColumn(name = "Products_idProducts", referencedColumnName = "idProducts")}
	)
	List<Products> productsList = new ArrayList<Products>();


	@Column(name  = "email")
	private String email;

	@Column(name = "phone")
	private String phone;
	@Column(name = "male")
	private Integer male;


	public User() {
	}

	public User(String username, String password, boolean enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public User(String username, String password, boolean enabled, String email, String phone, Integer male) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.email = email;
		this.phone = phone;
		this.male = male;
	}

	public User(String username, String password, boolean enabled, Set<UserRole> userRole) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
	}
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public boolean isEnabled() {
		return this.enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public Set<UserRole> getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}

}
