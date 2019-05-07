package com.comaniacs.dao.impl;

import com.comaniacs.models.Movie;
import com.comaniacs.utils.Functions;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.MovieDao;

public class MovieDaoImpl implements MovieDao{
	Session session;
	
	@Override
	public void addNew(Movie movie) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        //Save the employee in database
       	session.save(movie);
       	// Commit the transaction
        session.getTransaction().commit();

	}


	@SuppressWarnings("rawtypes")
	@Override
	public void updateMovie(Movie movie, int id) {
		try {
		session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
        
        //Save the employee in database
        Query query = session.createSQLQuery(
            "update MOVIE set title = :title" +
       		", original_title = :original_title"+
            	", release_date = :release_date"+
        		", vote_average = :vote_average"+
            	", overview = :overview"+
        		", poster_path = :poster_path"+
            	", backdrop_path = :backdrop_path"+
        		", category = :category"+
        		" where movie_id = :id");
          
        query.setParameter("title", movie.getTitle());
        query.setParameter("original_title", movie.getOriginal_title());
        query.setParameter("release_date", movie.getRelease_date());
        query.setParameter("vote_average", movie.getVote_average());
        query.setParameter("overview", movie.getOverview());
        query.setParameter("poster_path", movie.getPoster_path());
        query.setParameter("backdrop_path", movie.getBackdrop_path());
        query.setParameter("category", movie.getCategory());
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

	@SuppressWarnings("rawtypes")
	@Override
	public void deleteMovie(int movieId) {
		try {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
		
        String movieHQL = "DELETE FROM MOVIE where movie_id="+movieId+";";
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
	public List<?> findMovieById(int movieId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM MOVIE where movie_id="+movieId+";";
		Query query = session.createSQLQuery(movieHQL).addEntity(Movie.class);
		List results = query.list();
		
		session.close();
		
		return results;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> showNowPlaying(String category) {
		List<?> results = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
	        
			String movieHQL = "SELECT * FROM MOVIE where category='"+category+"';";
			Query query = session.createSQLQuery(movieHQL).addEntity(Movie.class);
			results = query.list();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}
		finally{
			session.close();
		}
		return results;
	}
	
	@Override
	public List<?> showUpcoming(String upcoming) {
		return null;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List showAllMovies() {
				
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String hql = "SELECT * FROM MOVIE LIMIT 5;";
		Query query = session.createSQLQuery(hql).addEntity(Movie.class);
		List results = query.list();
		 
		session.close();
		
		return results;
	}

	public MovieDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int getTotalPages() {
		Functions f = new Functions();
		int count = f.getCount();
		int maxPages = 0;
		
		double no_of_pages = count/5;
		int leftOver = (int)no_of_pages;
		double max_page = no_of_pages/leftOver;
		if(max_page > 0) {
			maxPages = leftOver+1;
		}
		
		return maxPages;
	}

	@SuppressWarnings("rawtypes")
	public List<?> showAllMovies(int min_limit, int max_limit) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String hql = "SELECT * FROM MOVIE LIMIT "+min_limit+","+max_limit+";";
		Query query = session.createSQLQuery(hql).addEntity(Movie.class);
		List results = query.list();
		 
		session.close();
		
		return results;
	}

}
