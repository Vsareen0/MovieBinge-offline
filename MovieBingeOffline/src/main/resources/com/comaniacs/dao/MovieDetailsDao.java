package com.comaniacs.dao;

import java.util.List;

import com.comaniacs.models.MovieDetails;

public interface MovieDetailsDao {

	public void addMovieDetails(MovieDetails movieDetails);
	
	public void updateMovieDetails(MovieDetails movieDetails,int id);
	
	public void deleteMovieDetailsById(int movieId);
	
	public List<?> getMovieDetailsById(int movieId);
}
