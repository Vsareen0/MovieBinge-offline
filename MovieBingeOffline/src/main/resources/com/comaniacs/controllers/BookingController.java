package com.comaniacs.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comaniacs.dao.impl.BookingDaoImpl;
import com.comaniacs.models.User;

@Controller
public class BookingController {

	@RequestMapping(value="/cancelTickets")
	public String  cancelTickets(@RequestParam("bookingId")int id ) {
		BookingDaoImpl bdi = new BookingDaoImpl();
		bdi.cancelTicket(id);
		return "redirect:/summary";
	}

	@RequestMapping(value="/cancelledTickets")
	public String  cancelledTickets(ModelMap model, HttpSession session ) {
		if(session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			Integer userId = user.getUserId();
			BookingDaoImpl bdi = new BookingDaoImpl();
			List<?> result = bdi.getCancelledSeatsById(userId);
			model.addAttribute("allCancelledBookings",result);
			model.addAttribute("user",session.getAttribute("loggedInUser"));
			model.addAttribute("checkLogin",true);
		}
		return "cancelledTickets";
	}

}
