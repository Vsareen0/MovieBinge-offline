package com.comaniacs.controllers;

import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.comaniacs.dao.impl.MovieDaoImpl;
import com.comaniacs.dao.impl.MovieDetailsDaoImpl;
import com.comaniacs.dao.impl.TrailersDaoImpl;
import com.comaniacs.models.Movie;
import com.comaniacs.models.MovieDetails;
import com.comaniacs.models.Trailers;
import com.comaniacs.utils.Functions;

@Controller
public class FormController {
	MovieDaoImpl mdi;
	MovieDetailsDaoImpl mddi;
	TrailersDaoImpl tdi;
	List<?> allMovies;
	int id=0;
	
	/*****************
	 * Add to Database *
	 * *****************/
	@RequestMapping(value="/addMovieToDatabase",method=RequestMethod.POST)
	public String addMovieToDatabase(@ModelAttribute("movie") Movie movie,
			@ModelAttribute("trailer") Trailers trailers,
			@ModelAttribute("movieDetails") MovieDetails moviedetails, Model model) {		
		
		// Pass the movie Object to Dao to add to database
		 MovieDaoImpl mdi=new MovieDaoImpl();
		 Random random = new Random();
	     String id = String.format("%04d", random.nextInt(10000));
         movie.setMovieId(Integer.parseInt(id));
		 mdi.addNew(movie);
		
		// Pass the trailer object to Dao to add to Database
		TrailersDaoImpl tdi = new TrailersDaoImpl();
		trailers.setTrailerId(Integer.parseInt(id));
		tdi.addTrailers(trailers);
		
		// Pass the movieDetails object to Dao to add to Database
		MovieDetailsDaoImpl mddi =new MovieDetailsDaoImpl();
		moviedetails.setMovieId(Integer.parseInt(id));
		mddi.addMovieDetails(moviedetails);
		
		// Add to model the movie Object
		model.addAttribute("movie",movie);
		model.addAttribute("trailers",trailers);
		model.addAttribute("movieDetails",moviedetails);
		
		return "display";
		
	}

	
	/*******************
	 *  Show Movies 
	 *  *****************/
	@RequestMapping(value="/showAllMovies",method=RequestMethod.GET)
	public String showAllMovies(Model model) {
		mdi =new MovieDaoImpl();
		List<?> allMovies = mdi.showAllMovies();
		
		int total_pages = mdi.getTotalPages();
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "showAllMovies";
	}
	
	@RequestMapping(value="/showAllMovies/{page_id}",method=RequestMethod.GET)
	public String showAllPagination(@PathVariable int page_id, Model model) {

		mdi =new MovieDaoImpl();
		Functions f = new Functions();
		int size = f.getCount();
		
		int total_pages = mdi.getTotalPages();
		
		int max_limit = page_id*5; 
		int min_limit = max_limit-5;
		int max_original_limit = 0;
		
		if(max_limit>size) {
			
			int diff = max_limit-size;
			max_original_limit = max_limit-diff-1;
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_original_limit);
			allMovies = mdi.showAllMovies(min_limit, max_original_limit);
		
		} else {
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_limit);
			allMovies = mdi.showAllMovies(min_limit, max_limit-1);
		}
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "showAllMovies";
	}
	
	/* Show Movies -- End */
	
	
	/***********************
	 *  Update Movies 
	 *  *********************/
	@RequestMapping(value="/updateMovies",method=RequestMethod.GET)
	public String updateMovies(Model model) {
		mdi =new MovieDaoImpl();
		List<?> allMovies = mdi.showAllMovies();
		
		int total_pages = mdi.getTotalPages();
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "updateMovies";
	}
	
	@RequestMapping(value="/updateMovies/{movie_id}",method=RequestMethod.GET)
	public String updateMovies(@PathVariable int movie_id, Model model) {
		mdi =new MovieDaoImpl();
		List<?> movie = mdi.findMovieById(movie_id);
		
		mddi = new MovieDetailsDaoImpl();
		List<?> movieDetails = mddi.getMovieDetailsById(movie_id);

		tdi = new TrailersDaoImpl();
		List<?> trailers = tdi.getTrailersById(movie_id);
		Trailers t = (Trailers) trailers.get(0);
		String s = t.getVideoKey();
		String[] arr = s.split(",");
		
		model.addAttribute("movie",movie.get(0));
		model.addAttribute("movieDetails",movieDetails.get(0));
		model.addAttribute("trailers",arr);
		
		id=movie_id;
		
		return "updateMovie";
	}
	
	@RequestMapping(value="/updatePagination/{page_id}",method=RequestMethod.GET)
	public String updatePagination(@PathVariable int page_id, Model model) {

		mdi =new MovieDaoImpl();
		Functions f = new Functions();
		int size = f.getCount();
		
		int total_pages = mdi.getTotalPages();
		
		int max_limit = page_id*5; 
		int min_limit = max_limit-5;
		int max_original_limit = 0;
		
		if(max_limit>size) {
			
			int diff = max_limit-size;
			max_original_limit = max_limit-diff-1;
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_original_limit);
			allMovies = mdi.showAllMovies(min_limit, max_original_limit);
		
		} else {
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_limit);
			allMovies = mdi.showAllMovies(min_limit, max_limit-1);
		}
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "updateMovies";
	}
	
	@RequestMapping(value="/updateToDatabase",method=RequestMethod.POST)
	public String updateMovie(@ModelAttribute("movie") Movie movie,
			@ModelAttribute("trailer") Trailers trailers,
			@ModelAttribute("movieDetails") MovieDetails moviedetails, Model model) {
		
		MovieDaoImpl mdi=new MovieDaoImpl();
		mdi.updateMovie(movie,id);
		
		TrailersDaoImpl tdi = new TrailersDaoImpl();
		tdi.updateTrailers(trailers,id);
		
		MovieDetailsDaoImpl mddi =new MovieDetailsDaoImpl();
		mddi.updateMovieDetails(moviedetails,id);
		
		// Add to model the movie Object
		model.addAttribute("movie",movie);
		model.addAttribute("trailers",trailers);
		model.addAttribute("movieDetails",moviedetails);
				
		return "display";
	}

	
	/*************************
	 *  Update Movies -- End 
	 *  *************************/
	@RequestMapping(value="/deleteMovies",method=RequestMethod.GET)
	public String deleteMovies(Model model) {
		mdi =new MovieDaoImpl();
		List<?> allMovies = mdi.showAllMovies();
		
		int total_pages = mdi.getTotalPages();
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "deleteMovies";
	}

	@RequestMapping(value="/deletePagination/{page_id}",method=RequestMethod.GET)
	public String deletePagination(@PathVariable int page_id, Model model) {

		mdi =new MovieDaoImpl();
		Functions f = new Functions();
		int size = f.getCount();
		
		int total_pages = mdi.getTotalPages();
		
		int max_limit = page_id*5; 
		int min_limit = max_limit-5;
		int max_original_limit = 0;
		
		if(max_limit>size) {
			
			int diff = max_limit-size;
			max_original_limit = max_limit-diff-1;
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_original_limit);
			allMovies = mdi.showAllMovies(min_limit, max_original_limit);
		
		} else {
			System.out.println("Max Limit"+max_limit+" > Size: "+size+" , "+min_limit+"  "+max_limit);
			allMovies = mdi.showAllMovies(min_limit, max_limit-1);
		}
		
		model.addAttribute("allMovies",allMovies);
		model.addAttribute("total_pages",total_pages);
		return "deleteMovies";
	}

	@RequestMapping(value="/deleteMovies/{movie_id}",method=RequestMethod.GET)
	public String deleteMovie(@PathVariable int movie_id) {
		mdi =new MovieDaoImpl();
		mdi.deleteMovie(movie_id);
		
		mddi = new MovieDetailsDaoImpl();
		mddi.deleteMovieDetailsById(movie_id);

		tdi = new TrailersDaoImpl();
		tdi.deleteTrailerById(movie_id);		
		return "display";
	}
	
	/* Update Movies -- End */
}
