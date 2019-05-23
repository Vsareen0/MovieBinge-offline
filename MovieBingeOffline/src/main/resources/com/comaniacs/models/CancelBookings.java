package com.comaniacs.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class CancelBookings implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int bookingId;
	private String theatre_room_no;
	private String booking_day;
	private String booking_time;
	private String user_id;
	private String movie_id;
	private int no_of_seats;
	private String seat_no;
	private Double cost;
	
	public String getBooking_day() {
		return booking_day;
	}
	
	public String getBooking_time() {
		return booking_time;
	}
	
	public int getBookingId() {
		return bookingId;
	}
	
	public Double getCost() {
		return cost;
	}
	
	public String getMovie_id() {
		return movie_id;
	}
	
	public int getNo_of_seats() {
		return no_of_seats;
	}
	
	public String getSeat_no() {
		return seat_no;
	}
	
	public String getTheatre_room_no() {
		return theatre_room_no;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setBooking_day(String booking_day) {
		this.booking_day = booking_day;
	}
	
	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}
	
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	
	public void setCost(Double cost) {
		this.cost = cost;
	}
	
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	
	public void setNo_of_seats(int no_of_seats) {
		this.no_of_seats = no_of_seats;
	}
	
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	
	public void setTheatre_room_no(String theatre_room_no) {
		this.theatre_room_no = theatre_room_no;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
