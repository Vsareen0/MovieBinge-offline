package com.comaniacs.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.comaniacs.helpers.TestHelper;
import com.comaniacs.models.Test;

@Controller
public class IndexController {

	/*	private final String now_playing="now playing";
		private final String upcoming="upcoming";
	 */
	
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(ModelMap model) throws InterruptedException {
//		TestHelper th = new TestHelper();
//		List<Test> test= th.getName();
//		System.out.println(test.size());
//		model.addAttribute("v",test);
		model.addAttribute("hello","Vinamra");
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
	
	@RequestMapping(value= {"/admin"},method=RequestMethod.GET)
	public String admin() {
		return "admin";
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
