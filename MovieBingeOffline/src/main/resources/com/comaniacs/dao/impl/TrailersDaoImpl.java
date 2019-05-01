package com.comaniacs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.TrailersDao;
import com.comaniacs.models.Trailers;

public class TrailersDaoImpl implements TrailersDao{
	Session session;
	
	@Override
	public void addTrailers(Trailers trailer) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        //Save the employee in database
       	session.save(trailer);
       	// Commit the transaction
        session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void deleteTrailerById(int trailerId) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
			
	        String movieHQL = "DELETE FROM TRAILERS where trailer_id="+trailerId+";";
			Query query = session.createSQLQuery(movieHQL);
			int res = query.executeUpdate();
				if(res>0) {
					System.out.println(res+" deleted");
				} else {
					System.out.println(res+" deleted");
				}
				session.getTransaction().commit();
				session.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
				session.getTransaction().rollback();
				session.close();
			}
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getTrailersById(int movieId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String trailersHQL = "SELECT * FROM TRAILERS where trailer_id="+movieId+";";
		Query trailersQuery = session.createSQLQuery(trailersHQL).addEntity(Trailers.class);
		List<?> trailersResults = trailersQuery.list();
		
		session.close();
		
		return trailersResults;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateTrailers(Trailers trailer, int id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
	        
	        //Save the employee in database
	        Query query = session.createSQLQuery(
	            "update TRAILERS set video_key = :videoKey" +
	       			" where trailer_id = :id");
	          
	        query.setParameter("title", trailer.getVideoKey());
	        query.setParameter("id", id);
	        
	        int res = query.executeUpdate();
	        
	        System.out.println(res);
	        
	       	// Commit the transaction
	        session.getTransaction().commit();
	        session.close();
	        
			}catch(Exception e) {
				System.out.println(e.getMessage());
				session.getTransaction().rollback();
				session.close();
			}
		
	}

}
