package com.comaniacs.models;

public class MovieDetails {
	private int movieId;
	private String genres;
	private String homepage;
	private String tagline;
	private String runtime;
	
	public int getMovieId() {
		return movieId;
	}
	
	public String getGenres() {
		return genres;
	}
	
	public String getHomepage() {
		return homepage;
	}
	
	public String getRuntime() {
		return runtime;
	}
	
	public String getTagline() {
		return tagline;
	}
	
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	
	public void setGenres(String genres) {
		this.genres = genres;
	}
	
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	
	public void setTagline(String tagline) {
		this.tagline = tagline;
	}
}
