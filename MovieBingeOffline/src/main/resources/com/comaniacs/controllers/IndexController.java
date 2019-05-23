package com.comaniacs.controllers;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comaniacs.configurations.MailSenderBean;
import com.comaniacs.dao.impl.BookingDaoImpl;
import com.comaniacs.dao.impl.MovieDaoImpl;
import com.comaniacs.dao.impl.ShowDaoImpl;
import com.comaniacs.models.Show;
import com.comaniacs.models.User;
import com.comaniacs.services.SeatingService;

@Controller
public class IndexController {

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(HttpSession session, ModelMap model) throws InterruptedException {
		if(session.getAttribute("loggedInUser") != null) {
			model.addAttribute("user",session.getAttribute("loggedInUser"));	
			model.addAttribute("checkLogin",true);
			model.addAttribute("userSuccess",true);
		}
		MovieDaoImpl mdi=new MovieDaoImpl();
		List<?> popular_movies = mdi.showNowPlaying("Now Playing");
		model.addAttribute("popular_movies",popular_movies);
		try {
			MailSenderBean msi = new MailSenderBean();
			msi.sendEmail("vsareen24@gmail.com", "vsareen0@gmail.com", "Testing", "This is a demo mail");
		}catch(Exception e) {
			System.out.println("Sending mail failed : "+e.getMessage());
		}
		return "index";
	}
	
	
	@RequestMapping(value= {"/user/success","/user/signin"})
	public String userSuccess(ModelMap model) {
		MovieDaoImpl mdi=new MovieDaoImpl();
		List<?> popular_movies = mdi.showNowPlaying("Now Playing");
		model.addAttribute("popular_movies",popular_movies);
		
		return "index";
	}
	
	@RequestMapping(value="/book",method=RequestMethod.GET)
	public String bookingPage(@RequestParam(value="userId",required=false)String id,HttpSession session,
			@RequestParam(value="movieId",required=true) int movieId, ModelMap model) {
		
		if(session.getAttribute("loggedInUser") != null){
			MovieDaoImpl mdi=new MovieDaoImpl();
			List<?> popular_movies = mdi.findMovieById(movieId);
			model.addAttribute("movie",popular_movies.get(0));
			
			if(session.getAttribute("loggedInUser") != null) {
				model.addAttribute("user",session.getAttribute("loggedInUser"));	
				model.addAttribute("checkLogin",true);
			}
			
			ShowDaoImpl sdi = new ShowDaoImpl();
			List<?> showTime = sdi.getShowTimmings(movieId);
			if(showTime.size() > 0 ) {
				Show show = (Show) showTime.get(0);
				String show_time = show.getSetTime();
				String[] s = show_time.split(",");
				Arrays.asList(s).stream().map(time -> time.toUpperCase());
				model.addAttribute("show",s);
				model.addAttribute("user_id",id);
				
				BookingDaoImpl bdi = new BookingDaoImpl();
				List<?> seats = bdi.getBookedSeats(movieId);
				SeatingService ss = new SeatingService();
				List<String> allSeats = ss.getSeats(seats, seats.size());
				model.addAttribute("size",seats.size());
				model.addAttribute("seats",allSeats);

				return "book";
			}else {
				List<?> popular_movies2 = mdi.showNowPlaying("Now Playing");
				model.addAttribute("popular_movies",popular_movies2);
				model.addAttribute("noShows",true);
				return "index";
			}
		}else {
			MovieDaoImpl mdi=new MovieDaoImpl();
			List<?> popular_movies = mdi.showNowPlaying("Now Playing");
			model.addAttribute("popular_movies",popular_movies);
			model.addAttribute("bookingError", true);
			return "index";
		}
	}

	@RequestMapping(value="/seatByDate",method=RequestMethod.GET)
	@ResponseBody
	public List<String> getSeatByDate(@RequestParam(value="movie_id",required=false) Integer movie_id, 
			@RequestParam(value="date",required=false) String date,
			@RequestParam(value="time",required=false) String time,
			ModelMap model) {
		BookingDaoImpl bdi = new BookingDaoImpl();
		System.out.println(movie_id+"  "+date);
		List<?> seats = bdi.getBookedSeats(movie_id,date,time);
		SeatingService ss = new SeatingService();
		List<String> allSeats = ss.getSeats(seats, seats.size());
		model.addAttribute("seats_booked",allSeats);
			
		return allSeats;
	}
	
//	@RequestMapping(value="/seatByDate",method=RequestMethod.GET,produces="application/json")
//	public ResponseEntity<List<String>> getSeatByDate(@RequestParam(value="movie_id",required=false) Integer movie_id, @RequestParam(value="date",required=false) String date,ModelMap model) {
//		ShowDaoImpl sdi = new ShowDaoImpl();
//		System.out.println("Seats: "+movie_id+"  "+date);
//		List<?> seats = sdi.getBookedSeats(movie_id,date);
//		SeatingService ss = new SeatingService();
//		List<String> allSeats = ss.getSeats(seats, seats.size());
//		return ResponseEntity.ok().body(allSeats);
//	}
	
	@RequestMapping(value="/booking/success",method=RequestMethod.GET)
	public String bookingSuccess(HttpSession session, ModelMap model) {
		if(session.getAttribute("loggedInUser")!=null) {
			BookingDaoImpl bdi = new BookingDaoImpl();
			List<?> seats = bdi.getBookedSeats(1318);
			model.addAttribute("seats",seats);
			model.addAttribute("user",session.getAttribute("loggedInUser"));
			model.addAttribute("checkLogin",true);
		}
		return "bookingSuccessful";
	}
	
	@RequestMapping(value= {"/booking/summary","/summary"},method=RequestMethod.GET)
	public String bookingSummary(HttpSession session,ModelMap model) {
		if(session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			Integer userId = user.getUserId();
			BookingDaoImpl bdi = new BookingDaoImpl();
			List<?> allBookings = bdi.showAllBookings(userId);
			model.addAttribute("allBookings",allBookings);
			model.addAttribute("user",session.getAttribute("loggedInUser"));
			model.addAttribute("checkLogin",true);
		}
		return "summary";
	}
	
	@RequestMapping(value= {"/bookingHistory"},method=RequestMethod.GET)
	public String bookingHistory(HttpSession session,ModelMap model) {
		if(session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			Integer userId = user.getUserId();
			BookingDaoImpl bdi = new BookingDaoImpl();
			List<?> allBookings = bdi.showAllBookings(userId);
			model.addAttribute("allBookings",allBookings);
			model.addAttribute("user",session.getAttribute("loggedInUser"));
			model.addAttribute("checkLogin",true);
		}
		return "bookingHistory";
	}
	
	@RequestMapping(value= {"/admin/account"},method=RequestMethod.GET)
	public String admin(HttpSession session,ModelMap model) {
		if(session.getAttribute("loggedInAdmin") == null) {
			model.addAttribute("error","Please, login in to access the admin panel");
			return "adminSignin";
		}
		return "admin";
	}
	
	@RequestMapping(value= {"/admin/signup"},method=RequestMethod.GET)
	public String adminSignup() {
		return "adminSignup";
	}
	
	@RequestMapping(value= {"/admin/signin","/admin"},method=RequestMethod.GET)
	public String adminSignin() {
		return "adminSignin";
	}
	
	@RequestMapping(value= {"/admin/logout"},method=RequestMethod.GET)
	public String adminSignout(HttpSession session) {
		session.removeAttribute("loggedInAdmin");
		session.invalidate();
		return "redirect:/admin";
	}
	
	@RequestMapping(value= {"/user/signin"},method=RequestMethod.GET)
	public String userSignin() {
		return "userSignin";
	}
	
	@RequestMapping(value= {"/user/logout"},method=RequestMethod.GET)
	public String userSignout(HttpSession session) {
		session.removeAttribute("loggedInUser"); 
		return "redirect:/";
	}
	
	@RequestMapping(value= {"/user/signup"},method=RequestMethod.GET)
	public String userSignup() {
		return "userSignup";
	}
	
	@RequestMapping(value="/dashboard")
	public String dashboard(ModelMap model) {
		MovieDaoImpl mdi=new MovieDaoImpl();
		List<?> popular_movies = mdi.showNowPlaying("Now Playing");
		
		BookingDaoImpl bdi = new BookingDaoImpl();
		List<?> allBookings = bdi.getPurchases();
		
		
		model.addAttribute("sizeOfPlayingMovies",popular_movies.size());
		model.addAttribute("sizeOfBookedTickets",allBookings.size());
		model.addAttribute("sizeOfCancelledTickets",allBookings.size());
		return "dashboard";
	}

	@RequestMapping(value="/purchases")
	public String purchases(ModelMap model) {
		BookingDaoImpl bdi = new BookingDaoImpl();
		List<?> allBookings = bdi.getPurchases();
		model.addAttribute("allBookings", allBookings);
		return "purchases";
	}

	@RequestMapping(value="/addNewMovie")
	public String addNewMovie() {
		return "addNewMovie";
	}
	
	@RequestMapping(value="/addShowTimmings")
	public String addShowTimmings(ModelMap model) {
		MovieDaoImpl mdi=new MovieDaoImpl();
		List<?> popular_movies = mdi.showNowPlaying("Now Playing");
		model.addAttribute("movies",popular_movies);
		return "showTimmings";
	}
	
}
