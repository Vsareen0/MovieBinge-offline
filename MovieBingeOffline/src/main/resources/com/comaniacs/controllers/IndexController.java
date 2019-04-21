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

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(ModelMap model) throws InterruptedException {
		TestHelper th = new TestHelper();
		List<Test> test= th.getName();
		System.out.println(test.size());
		model.addAttribute("v",test);
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
}
