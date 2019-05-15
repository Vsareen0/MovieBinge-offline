package com.comaniacs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.UserDao;
import com.comaniacs.models.User;

public class UserDaoImpl implements UserDao{
	Session session;
	
	@Override
	public void addNewUser(User user) {
		try {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        //Save the user in database
       	session.save(user);
       	// Commit the transaction
        session.getTransaction().commit();
        session.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
			session.close();
		}
	}

	@SuppressWarnings("rawtypes")
	public List<?> checkCredentails(String name, String password) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String userHQL = "SELECT * FROM USER where USERNAME='"+name+"' AND PASSWORD='"+password+"';";
		Query query = session.createSQLQuery(userHQL).addEntity(User.class);
		List results = query.list();
		
		session.close();
		
		return results;
	}

}
