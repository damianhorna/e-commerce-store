package com.damianhorna.mvc.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.damianhorna.mvc.service.TransactionService;

@Controller
public class HomeController {

	@Autowired
	private TransactionService transactionService;	
	
	@GetMapping("/")
	public String home(Model m, Principal principal, HttpServletRequest request) {
		request.getSession().setAttribute("itemsInTheCart", transactionService.getTransactions(principal.getName()).size());
		return "index";
	}
}
