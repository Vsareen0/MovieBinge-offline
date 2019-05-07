package com.comaniacs.dao;

import java.util.List;

import com.comaniacs.models.Movie;

public interface MovieDao {
	
	public void addNew(Movie movie);
	
	public void updateMovie(Movie movie,int id);
	
	public void deleteMovie(int movieId);
	
	public List<?> findMovieById(int movieId);
	
	public List<?> showNowPlaying(String now_playing);
	
	public List<?> showUpcoming(String upcoming);
	
	public int getTotalPages();
	
	@SuppressWarnings("rawtypes")
	public List showAllMovies();
}
