package com.comaniacs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.dao.BookingDao;
import com.comaniacs.models.Booking;
import com.comaniacs.models.CancelBookings;

public class BookingDaoImpl implements BookingDao{
	Session session;
	
	@Override
	public void addNew(Booking booking) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().setTimeout(900);
        
        //Save the booking in database
       	session.save(booking);
       	// Commit the transaction
        session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List showAllBookings(Integer user_id) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String hql = "SELECT * FROM BOOKINGS where user_id="+ user_id +";";
		Query query = session.createSQLQuery(hql).addEntity(Booking.class);
		List results = query.list();
		 
		session.close();
		
		return results;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getBookedSeats(int movieId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM BOOKINGS where movie_id="+movieId+";";
		Query query = session.createSQLQuery(movieHQL).addEntity(Booking.class);
		List<?> results = query.list();
		
		session.close();
		
		return results;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getBookedSeatsById(int bookingId) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM BOOKINGS where booking_id="+bookingId+";";
		Query query = session.createSQLQuery(movieHQL).addEntity(CancelBookings.class);
		List<?> results = query.list();
		
		session.close();
		
		return results;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getBookedSeats(int movieId, String date, String time) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM BOOKINGS where movie_id="+movieId+" and booking_day='"+date+"' and booking_time='"+time+"';";
		Query query = session.createSQLQuery(movieHQL).addEntity(Booking.class);
		List<?> results = query.list();
		
		session.close();
		
		return results;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getPurchases() {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String movieHQL = "SELECT * FROM BOOKINGS ;";
		Query query = session.createSQLQuery(movieHQL).addEntity(Booking.class);
		List<?> results = query.list();
		
		session.close();
		
		return results;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void cancelTicket(int bookingId) {
		
		List<?> result = getBookedSeatsById(bookingId);
		CancelBookings cancelBooking = (CancelBookings) result.get(0);
		insertCancelledTicketToDatabase(cancelBooking);

		try {
			session = HibernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
			
	        String movieHQL = "DELETE FROM Bookings where booking_id="+bookingId+";";
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

	private void insertCancelledTicketToDatabase(CancelBookings booking) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().setTimeout(900);
        
        //Save the booking in database
       	session.save(booking);
       	// Commit the transaction
        session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getCancelledSeatsById(int user_id) {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String hql = "SELECT * FROM CANCEL_BOOKINGS where user_id="+ user_id +";";
		Query query = session.createSQLQuery(hql).addEntity(CancelBookings.class);
		List<?> results = query.list();
		 
		session.close();
		
		return results;
	}


}
