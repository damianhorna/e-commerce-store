package com.damianhorna.mvc.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;

//import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.damianhorna.mvc.entities.Item;
import com.damianhorna.mvc.entities.Transaction;
import com.damianhorna.mvc.entities.TransactionArchived;
import com.damianhorna.mvc.service.ItemService;
import com.damianhorna.mvc.service.TransactionArchivedService;
import com.damianhorna.mvc.service.TransactionService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private TransactionArchivedService transactionArchivedService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor ste = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, ste);
		
	}
	
	
	
	@GetMapping("/view")
	public String viewItem(Model m, @RequestParam("id") int id) {
		Item item = itemService.getItem(id);
		m.addAttribute("item", item);
		return "view-item";
	}

	@PostMapping("/transaction")
	public String handleTransaction(Model m, @RequestParam String action, @RequestParam int id,
			@RequestParam int quantity, Principal principal, HttpServletRequest request) {
		if (action.equals("Buy now")) {
			setProperQuantityInDb(m, id, quantity);
			Item item = itemService.getItem(id);
			
			Transaction transaction = new Transaction(item.getId(), principal.getName(), item.getOwnerUsername(), quantity, item.getName(),
					item.getPrice());
			TransactionArchived transactionArchived = new TransactionArchived(transaction);
			
			transactionArchivedService.saveTransaction(transactionArchived);
			return "item-bought";
		} else if (action.equals("Add to cart")) {
			setProperQuantityInDb(m, id, quantity);
			String buyer = principal.getName();
			addToCart(m, id, quantity, buyer);

			request.getSession().setAttribute("itemsInTheCart",
					transactionService.getTransactions(principal.getName()).size());
			return "item-added-to-cart";
		} else
			return "unexpected-error";
	}

	private void addToCart(Model m, int id, int quantity, String buyer) {
		Item item = itemService.getItem(id);
		Transaction transaction;
		try {
			transaction = transactionService.getTransactionByItemId(id);
			int qBefore = transaction.getQuantity();
			int qAfter = qBefore + quantity;
			transaction.setQuantity(qAfter);
		} catch (NoResultException e) {
			transaction = new Transaction(item.getId(), buyer, item.getOwnerUsername(), quantity, item.getName(),
					item.getPrice());
		}
		transactionService.saveTransaction(transaction);
	}

	private void setProperQuantityInDb(Model m, int id, int quantity) {
		Item item = itemService.getItem(id);
		m.addAttribute("item", item);
		int properQuantity = item.getQuantity() - quantity;

		item.setQuantity(properQuantity);
		itemService.saveItem(item);

		m.addAttribute("quantity", quantity);
	}

	@GetMapping("/sell")
	public String sellItem(Model m) {
		Item itemToSell = new Item();

		Map<String, String> availableCategories = new LinkedHashMap<String, String>();
		availableCategories.put("fashion", "fashion");
		availableCategories.put("sport", "sport");
		availableCategories.put("home", "home");
		availableCategories.put("electronics", "electronics");

		m.addAttribute("availableCategories", availableCategories);
		m.addAttribute("itemToSell", itemToSell);
		return "sell";
	}

	@PostMapping("/sell")
	public String confirmAndSell(@Valid @ModelAttribute("itemToSell") Item item,  BindingResult result,Principal principal,
			@RequestParam MultipartFile file, HttpServletRequest request, Model m) {
		if(result.hasErrors()) {
			Map<String, String> availableCategories = new LinkedHashMap<String, String>();
			availableCategories.put("fashion", "fashion");
			availableCategories.put("sport", "sport");
			availableCategories.put("home", "home");
			availableCategories.put("electronics", "electronics");
			m.addAttribute("availableCategories", availableCategories);
			m.addAttribute("itemToSell",item);
			return "sell";
		} else {
			item.setOwnerUsername(principal.getName());

			itemService.saveItem(item);

			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();

					String rootPath = request.getSession().getServletContext().getRealPath("/");
					// Create the file on server
					File serverFile = new File(rootPath + File.separator + "resources" + File.separator + "img"
							+ File.separator + "items" + File.separator + item.getId() + "-0.png");
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
				} catch (Exception e) {
					return "You failed to upload " + " => " + e.getMessage();
				}
			} else {

			}
			return "redirect:/";
		}
		
		
		
	}


	
	
	
	
	
	
	
	
	
	
	
	

}
