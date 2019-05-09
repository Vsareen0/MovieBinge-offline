package com.comaniacs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.ShowDao;
import com.comaniacs.models.Movie;
import com.comaniacs.models.Show;

public class ShowDaoImpl implements ShowDao{
	Session session;
	
	@Override
	public boolean checkIfTimmingsExist(Show show) {
		
		return false;
	}

	@Override
	public void addShowTimmings(Show show) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        //Save the show in database
       	session.save(show);
       	// Commit the transaction
        session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	public List<?> getShowTimmings(int movieId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM SHOWS where movie_id="+movieId+";";
		Query query = session.createSQLQuery(movieHQL).addEntity(Show.class);
		List results = query.list();
		
		session.close();
		
		return results;
	}
	

}
