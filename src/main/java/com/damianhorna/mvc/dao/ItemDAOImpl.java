package com.damianhorna.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damianhorna.mvc.entities.Item;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Item> getItems(String category) {	
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Item> theQuery = currentSession.createQuery("from Item where category=:category and quantity>0",Item.class);	
		theQuery.setParameter("category", category);
		List<Item> items = theQuery.getResultList();	
		return items;
	}

	@Override
	public void saveItem(Item item) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(item);
	}

	@Override
	public Item getItem(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Item item = currentSession.get(Item.class, id);
		return item;
	}

	@Override
	public void deleteItem(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Item item = currentSession.get(Item.class, id);
		currentSession.delete(item);
	}

	@Override
	public List<Item> getItemsByOwner(String ownerUsername) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Item> theQuery = currentSession.createQuery("from Item where ownerUsername=:ownerUsername and quantity>0",Item.class);	
		theQuery.setParameter("ownerUsername", ownerUsername);
		List<Item> items = theQuery.getResultList();	
		return items;
	}


}
