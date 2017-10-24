package com.damianhorna.mvc.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.damianhorna.mvc.entities.Item;
import com.damianhorna.mvc.service.ItemService;

@Controller()
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping("on-sale")
	public String onSale(Model m, Principal principal) {

		List<Item> items = itemService.getItemsByOwner(principal.getName());
		m.addAttribute("items", items);
		m.addAttribute("itemsOnSale", items.size());
		return "on-sale";
	}
	@PostMapping("on-sale-actions")
	public String onSaleActions(Model m, Principal principal, @RequestParam int id, @RequestParam int quantity,
			@RequestParam String action, HttpServletRequest request) {
		if (action.equals("edit")) {
			return "edit";
		} else if (action.equals("delete")) {
			Item item = itemService.getItem(id);
			item.setQuantity(item.getQuantity() - quantity);
			itemService.saveItem(item);
			return "redirect:/account/on-sale";
		} else
			return "redirect: /";
	}
	
	@GetMapping("sold")
	public String viewSoldItems(Model m) {
		return "sold";
	}
	@GetMapping("bought")
	public String viewBoughtItems(Model m) {
		return "bought";
	}
	@GetMapping("account-settings")
	public String viewAccountSettings(Model m) {
		return "account-settings";
	}
}
