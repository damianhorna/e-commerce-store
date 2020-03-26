package com.damianhorna.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.damianhorna.mvc.entities.Item;
import com.damianhorna.mvc.service.ItemService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private ItemService itemService;
	
	@GetMapping("/list")
	public String list(Model m, @RequestParam("category") String category){
		
		List<Item> items = itemService.getItems(category);	
		m.addAttribute("items",items);	
		m.addAttribute("category",category);
		return "list-items";
	}
}
