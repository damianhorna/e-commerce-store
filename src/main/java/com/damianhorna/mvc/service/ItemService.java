package com.damianhorna.mvc.service;

import java.util.List;

import com.damianhorna.mvc.entities.Item;

public interface ItemService {
	public List<Item> getItems(String category);

	public void saveItem(Item item);

	public Item getItem(int id);

	public void deleteItem(int id);

	public List<Item> getItemsByOwner(String ownerUsername);
}
