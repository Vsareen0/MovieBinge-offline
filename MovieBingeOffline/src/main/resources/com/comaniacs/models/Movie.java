package com.comaniacs.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Movie {
	
	/* Fields */
	@Id
	@GeneratedValue
	private int movieId;
	private String title;
	private String original_title;
	private String overview;
	private String poster_path;
	private String backdrop_path;
	private String release_date;
	private double vote_average;
	private String category;
	private Set<MovieDetails> movieDetails;
	private Set<Trailers> trailers=new HashSet<Trailers>();
	
	/* Getter Methods */
	public String getBackdrop_path() {
		return backdrop_path;
	}
	
	public int getMovieId() {
		return movieId;
	}
	
	public String getOriginal_title() {
		return original_title;
	}
	
	public String getOverview() {
		return overview;
	}
	
	public String getPoster_path() {
		return poster_path;
	}
	
	public String getRelease_date() {
		return release_date;
	}
	
	public String getTitle() {
		return title;
	}
	
	public double getVote_average() {
		return vote_average;
	}
	
	public String getCategory() {
		return category;
	}
	
	public Set<MovieDetails> getMovieDetails() {
		return movieDetails;
	}
	
	public Set<Trailers> getTrailers() {
		return trailers;
	}
	
	/* Setter Methods */
	public void setBackdrop_path(String backdrop_path) {
		this.backdrop_path = backdrop_path;
	}
	
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	
	public void setOriginal_title(String original_title) {
		this.original_title = original_title;
	}
	
	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}
	
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setVote_average(double vote_average) {
		this.vote_average = vote_average;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public void setMovieDetails(Set<MovieDetails> movieDetails) {
		this.movieDetails = movieDetails;
	}
	
	public void setTrailers(Set<Trailers> trailers) {
		this.trailers = trailers;
	}
	
}
