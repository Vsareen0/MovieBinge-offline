package com.comaniacs.dao;

import java.util.List;

import com.comaniacs.models.Trailers;

public interface TrailersDao {

	public void addTrailers(Trailers trailer);
	
	public void updateTrailers(Trailers trailer,int id);
	
	public void deleteTrailerById(int movieId);
	
	public List<?> getTrailersById(int movieId);
}
