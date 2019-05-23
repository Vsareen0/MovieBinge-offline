package com.comaniacs.dao;

import java.util.List;
import com.comaniacs.models.Booking;

public interface BookingDao {

	public void addNew(Booking booking);
	
	@SuppressWarnings("rawtypes")
	public List showAllBookings(Integer user_id);
	
	public List<?> getBookedSeats(int movie_id);

	public List<?> getBookedSeatsById(int booking_id);

	List<?> getBookedSeats(int movieId, String date, String time);

	List<?> getPurchases();
	
	List<?> getCancelledSeatsById(int user_id);
	
	public void cancelTicket(int bookingId);
	
}
