package com.comaniacs.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.comaniacs.dao.impl.MovieDaoImpl;
import com.comaniacs.helpers.TestHelper;
import com.comaniacs.models.Test;

@Controller
public class IndexController {

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(ModelMap model) throws InterruptedException {
//		TestHelper th = new TestHelper();
//		List<Test> test= th.getName();
//		System.out.println(test.size());
//		model.addAttribute("v",test);
		MovieDaoImpl mdi=new MovieDaoImpl();
		List<?> popular_movies = mdi.showNowPlaying("Now Playing");
		model.addAttribute("popular_movies",popular_movies);
		return "index";
	}
	
	@RequestMapping(value="/test")
	public String test(ModelMap model) {
		TestHelper th = new TestHelper();
		List<Test> test= th.getName();
		System.out.println(test.size());
		model.addAttribute("v",test);
		return "test";
	}
	
	@RequestMapping(value= {"/admin/account"},method=RequestMethod.POST)
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
		return "adminSignin";
	}
	
	@RequestMapping(value= {"/user/signin"},method=RequestMethod.GET)
	public String userSignin() {
		return "userSignin";
	}
	
	@RequestMapping(value= {"/user/signup"},method=RequestMethod.GET)
	public String userSignup() {
		return "userSignup";
	}
	
	@RequestMapping(value="/dashboard")
	public String dashboard() {
		return "dashboard";
	}

	@RequestMapping(value="/purchases")
	public String purchases() {
		return "purchases";
	}

	@RequestMapping(value="/addNewMovie")
	public String addNewMovie() {
		return "addNewMovie";
	}
}
