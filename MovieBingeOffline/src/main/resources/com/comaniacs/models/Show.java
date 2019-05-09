package com.comaniacs.models;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Show {

	@Id
	@GeneratedValue
	private int showId;
	private int movieId;
	private String setTime;
	private String theatre_room_no;
	
	public int getMovieId() {
		return movieId;
	}
	
	public String getSetTime() {
		return setTime;
	}
	
	public int getShowId() {
		return showId;
	}
	
	public String getTheatre_room_no() {
		return theatre_room_no;
	}
	
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	
	public void setSetTime(String setTime) {
		this.setTime = setTime;
	}
	
	public void setShowId(int showId) {
		this.showId = showId;
	}
	
	public void setTheatre_room_no(String theatre_room_no) {
		this.theatre_room_no = theatre_room_no;
	}
	
}
