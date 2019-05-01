package com.comaniacs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.MovieDetailsDao;
import com.comaniacs.models.MovieDetails;


public class MovieDetailsDaoImpl implements MovieDetailsDao{
	Session session;
	
	@Override
	public void addMovieDetails(MovieDetails movieDetails) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        //Save the employee in database
       	session.save(movieDetails);
       	// Commit the transaction
        session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void deleteMovieDetailsById(int movieId) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
			
	        String movieHQL = "DELETE FROM MOVIEDETAILS where movie_id="+movieId+";";
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
	public List<?> getMovieDetailsById(int movieId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieDetailsHQL = "SELECT * FROM MOVIEDETAILS where movie_id="+movieId+";";
		Query movieQuery = session.createSQLQuery(movieDetailsHQL).addEntity(MovieDetails.class);
		List<?> movieResults = movieQuery.list();
		
		session.close();
		
		return movieResults;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void updateMovieDetails(MovieDetails movieDetails, int id) {
	try {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
      //Save the employee in database
        Query query = session.createSQLQuery(
            "update MOVIEDETAILS set genres = :genres" +
       		", homepage = :homepage"+
            	", tagline = :tagline"+
        		", runtime = :runtime"+
            	" where movie_id = :id");
          
        query.setParameter("genres", movieDetails.getGenres());
        query.setParameter("homepage", movieDetails.getHomepage());
        query.setParameter("tagline", movieDetails.getTagline());
        query.setParameter("runtime", movieDetails.getRuntime());
        query.setParameter("id", id);
        
        int res = query.executeUpdate();
        System.out.println(res);
       	// Commit the transaction
        session.getTransaction().commit();
        session.close();
		} catch(Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
			session.close();
		}
	}

}
