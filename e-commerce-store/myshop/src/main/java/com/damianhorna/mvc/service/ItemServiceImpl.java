package com.damianhorna.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damianhorna.mvc.dao.ItemDAO;
import com.damianhorna.mvc.entities.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	@Transactional
	@Cacheable("items")
	public List<Item> getItems(String category) {
		return itemDAO.getItems(category);
	}

	@Override
	@Transactional
	@CacheEvict(value="items",allEntries=true)
	public void saveItem(Item item) {
		itemDAO.saveItem(item);
	}

	@Override
	@Transactional
	@Cacheable("items")
	public Item getItem(int id) {
		return itemDAO.getItem(id);
	}

	@Override
	@Transactional
	@CacheEvict(value="items",allEntries=true)
	public void deleteItem(int id) {
		itemDAO.deleteItem(id);
	}

	@Override
	@Transactional
	@Cacheable("items")
	public List<Item> getItemsByOwner(String ownerUsername) {
		
		
		return itemDAO.getItemsByOwner(ownerUsername);
	}

}
