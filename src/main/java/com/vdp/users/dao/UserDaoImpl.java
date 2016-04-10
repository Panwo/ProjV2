package com.vdp.users.dao;

import com.vdp.users.model.Products;
import com.vdp.users.model.User;
import com.vdp.users.model.UserRole;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
/*
	@Autowired
	private SessionFactory sessionFactory;*/

	@PersistenceContext
	EntityManager entityManager;

  public  User findByUserName(String username){
	  List<User> list = new ArrayList<User>();
	  Query query;
	  query = entityManager.createQuery("select  u from User u where  u.username = :username", User.class);
	  query.setParameter("username", username);

	  list = (List<User>) query.getResultList();
	  return list.get(0);
  }

	@Override
	public  void registerNew(User user, UserRole role){
		entityManager.merge(user);
		entityManager.merge(role);
	}


	/*@SuppressWarnings("unchecked")
	public User findByUserName(String username) {
		List<User> users = new ArrayList<User>();
			users = sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username)
				.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}*/

}