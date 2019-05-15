package com.comaniacs.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.comaniacs.models.Booking;

public class SeatingService {

	public List<String> getSeats(List<?> seats, int size) {
		List<String> allSeats = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		
		for(int i=0;i<size;i++) {
			Booking b = (Booking) seats.get(i);
			String seat_no = b.getSeat_no();
			sb.append(seat_no+",");
		}
		allSeats = new ArrayList<>(Arrays.asList(sb.toString().split(",")));
		System.out.println(allSeats);
		return allSeats;
	}
	
}
