package com.damianhorna.mvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login(ModelMap m){
		return "login";
	}
	
	@GetMapping("/loginFailed")
	public String loginFailed(ModelMap m){
		m.addAttribute("error","true");
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(ModelMap m){
		return "logout";
	}
	
	@GetMapping("/403")
	public String error403(ModelMap m){
		return "403";
	}
}
