package com.damianhorna.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damianhorna.mvc.entities.TransactionArchived;
@Repository
public class TransactionArchivedDAOImpl implements TransactionArchivedDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<TransactionArchived> getSold(String seller) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<TransactionArchived> theQuery = currentSession.createQuery("from TransactionArchived where seller=:seller",TransactionArchived.class);	
		theQuery.setParameter("seller", seller);
		List<TransactionArchived> sold = theQuery.getResultList();	
		return sold;
	}

	@Override
	public List<TransactionArchived> getBought(String buyer) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<TransactionArchived> theQuery = currentSession.createQuery("from TransactionArchived where buyer=:buyer",TransactionArchived.class);	
		theQuery.setParameter("buyer", buyer);
		List<TransactionArchived> bought = theQuery.getResultList();	
		return bought;
	}

	@Override
	public void saveTransaction(TransactionArchived transactionArchived) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(transactionArchived);
	}

	@Override
	public TransactionArchived getTransaction(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		TransactionArchived transactionArchived = currentSession.get(TransactionArchived.class, id);
		return transactionArchived;
	}

	@Override
	public void deleteTransaction(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		TransactionArchived transactionArchived = currentSession.get(TransactionArchived.class, id);
		currentSession.delete(transactionArchived);
	}

	@Override
	public TransactionArchived getTransactionByItemId(int id) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<TransactionArchived> theQuery = currentSession.createQuery("from TransactionArchived where item_id=:id and transaction_time!=null",TransactionArchived.class);	
		theQuery.setParameter("id", id);
		TransactionArchived transactionArchived = theQuery.getSingleResult();	
		return transactionArchived;
	}

}
