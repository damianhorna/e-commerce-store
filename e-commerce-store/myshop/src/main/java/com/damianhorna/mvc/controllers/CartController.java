package com.damianhorna.mvc.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.damianhorna.mvc.entities.Item;
import com.damianhorna.mvc.entities.Transaction;
import com.damianhorna.mvc.entities.TransactionArchived;
import com.damianhorna.mvc.service.ItemService;
import com.damianhorna.mvc.service.TransactionArchivedService;
import com.damianhorna.mvc.service.TransactionService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	TransactionService transactionService;
	
	@Autowired
	TransactionArchivedService transactionArchivedService;
	
	@Autowired
	ItemService itemService;
	
	@RequestMapping(value="/")
	public ModelAndView cartItems() {
		ModelAndView mav = new ModelAndView("cart");
		return mav;
	}
	
	@RequestMapping(value="/view")
	public @ResponseBody List<Transaction> ajaxCart(HttpServletRequest req, HttpServletResponse res, Principal principal, Model m){
		List<Transaction> transactions = transactionService.getTransactions(principal.getName());
		m.addAttribute("transactions",transactions);
		return transactions;
	}
	
	@RequestMapping(value="/delete-from-cart")
	public @ResponseBody void deleteItemFromCart(HttpServletRequest req, HttpServletResponse res, Principal principal, Model m) {
		
		Item item = itemService.getItem(Integer.parseInt(req.getParameter("itemId")));
		item.setQuantity(item.getQuantity()+Integer.parseInt(req.getParameter("quantity")));
		itemService.saveItem(item);
		transactionService.deleteTransaction(Integer.parseInt(req.getParameter("transactionId")));
		
		req.getSession().setAttribute("itemsInTheCart", transactionService.getTransactions(principal.getName()).size());
		System.out.println("item in the cart value is set");

		List<Transaction> transactions = transactionService.getTransactions(principal.getName());
		m.addAttribute("transactions", transactions);
	}
	

	@GetMapping("")
	public String view(Model m, Principal principal) {
		List<Transaction> transactions = transactionService.getTransactions(principal.getName());
		m.addAttribute("transactions", transactions);
		return "cart";
	}

	@PostMapping("delete-from-cart")
	public String deleteFromCart(Model m, Principal principal, @RequestParam int itemId, @RequestParam int quantity, @RequestParam int transactionId, HttpServletRequest request) {
		Item item = itemService.getItem(itemId);
		item.setQuantity(item.getQuantity()+quantity);
		itemService.saveItem(item);
		transactionService.deleteTransaction(transactionId);
		request.getSession().setAttribute("itemsInTheCart", transactionService.getTransactions(principal.getName()).size());
		return "redirect:/cart";
	}

	@GetMapping("delete-all")
	public String deleteAll(Model m, Principal principal, HttpServletRequest request) {
		List<Transaction> transactions = transactionService.getTransactions(principal.getName());
		for(Transaction t:transactions) {
			Item item = itemService.getItem(t.getItemId());
			item.setQuantity(item.getQuantity()+t.getQuantity());
			itemService.saveItem(item);
			transactionService.deleteTransaction(t.getId());
		}
		request.getSession().setAttribute("itemsInTheCart", 0);		
		return "cart";
	}
	
	@PostMapping("transaction-complete")
	public String transactionCompletion(Model m, Principal principal, HttpServletRequest request) {
		List<Transaction> transactions = transactionService.getTransactions(principal.getName());
		for(Transaction t:transactions) {
			TransactionArchived transactionArchived = new TransactionArchived(t);
			transactionService.deleteTransaction(t.getId());
			transactionArchivedService.saveTransaction(transactionArchived);
		}
		transactionService.refreshAll();
		request.getSession().setAttribute("itemsInTheCart", 0);	
		return "redirect:/";
	}

	@GetMapping("payment")
	public String payment(Model m) {
		// TODO
		return "payment";
	}
	
	
	
	
	
	
	
	
	
	
}
