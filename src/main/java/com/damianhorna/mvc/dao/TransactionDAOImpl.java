package com.damianhorna.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damianhorna.mvc.entities.Transaction;

@Repository
public class TransactionDAOImpl implements TransactionDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Transaction> getTransactions(String buyer) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Transaction> theQuery = currentSession.createQuery("from Transaction where buyer=:buyer and transaction_time=null",Transaction.class);	
		theQuery.setParameter("buyer", buyer);
		List<Transaction> transactions = theQuery.getResultList();	
		return transactions;
	}

	@Override
	public void saveTransaction(Transaction transaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(transaction);
	}

	@Override
	public Transaction getTransaction(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Transaction transaction = currentSession.get(Transaction.class, id);
		return transaction;
	}

	@Override
	public void deleteTransaction(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Transaction transaction = currentSession.get(Transaction.class, id);
		currentSession.delete(transaction);
	}

	@Override
	public Transaction getTransactionByItemId(int id) {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Transaction> theQuery = currentSession.createQuery("from Transaction where item_id=:id and transaction_time=null",Transaction.class);	
		theQuery.setParameter("id", id);
		Transaction transaction = theQuery.getSingleResult();	
		return transaction;
	}

	@Override
	public void deleteTransactions(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transaction> query = currentSession.createQuery("delete from Transaction where buyer=:name",Transaction.class);	
		query.setParameter("name", name);
		query.executeUpdate();
	}

}
