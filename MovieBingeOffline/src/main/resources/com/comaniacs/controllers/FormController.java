package com.comaniacs.controllers;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.comaniacs.dao.impl.BookingDaoImpl;
import com.comaniacs.dao.impl.MovieDaoImpl;
import com.comaniacs.dao.impl.UserDaoImpl;
import com.comaniacs.models.Booking;
import com.comaniacs.models.Login;
import com.comaniacs.models.User;

@Controller
public class FormController {

	@RequestMapping(value="/processAdminLogin",method=RequestMethod.POST)
	public String processAdminLoginForm(@ModelAttribute("admin") Login user, HttpSession session, ModelMap model) {
		if(user.getName().equals("Vinamra") && user.getPassword().equals("1234")) {
			session.setAttribute("loggedInAdmin", user);
			return "redirect:/admin/account";
		}
		model.addAttribute("error","Invalid Credentails !");
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/processUserLogin",method=RequestMethod.POST)
	public String processUserLogin(@ModelAttribute("admin") Login user, HttpSession session, ModelMap model) {
		UserDaoImpl udi =new UserDaoImpl();
		List<?> userResult = udi.checkCredentails(user.getName(),user.getPassword());
		if(userResult.size() > 0) {
			MovieDaoImpl mdi=new MovieDaoImpl();
			List<?> popular_movies = mdi.showNowPlaying("Now Playing");
			model.addAttribute("popular_movies",popular_movies);
			model.addAttribute("checkLogin",true);
			session.setAttribute("loggedInUser", userResult.get(0));
			model.addAttribute("user",userResult.get(0));
			return "redirect:/";
		}
		model.addAttribute("error","Invalid Credentails !");
		return "redirect:/userSignin";
	}
	
	@RequestMapping(value="/processSignup",method=RequestMethod.POST)
	public String processSignup(@ModelAttribute("user") User user, ModelMap model) {
		UserDaoImpl udi = new UserDaoImpl();
		udi.addNewUser(user);
		return "redirect:/user/success";
	}
	
	@RequestMapping(value="/booking",method=RequestMethod.POST)
	public String booking(@ModelAttribute("booking") Booking booking, ModelMap model) {
		BookingDaoImpl book = new BookingDaoImpl();
		Random random = new Random();
		String id = String.format("%04d", random.nextInt(10000));
        booking.setBookingId(Integer.parseInt(id));
		book.addNew(booking);
		return "redirect:/booking/success";
	}
	
}
