package com.damianhorna.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damianhorna.mvc.dao.TransactionDAO;
import com.damianhorna.mvc.entities.Transaction;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionDAO transactionDAO;
	
	@Override
	@Transactional
	@Cacheable("transactions")
	public List<Transaction> getTransactions(String buyer) {
		return transactionDAO.getTransactions(buyer);
	}

	@Override
	@Transactional
	@CacheEvict(value="transactions", allEntries=true)
	public void saveTransaction(Transaction transaction) {
		transactionDAO.saveTransaction(transaction);
	}

	@Override
	@Transactional
	public Transaction getTransaction(int id) {
		return transactionDAO.getTransaction(id);
	}

	@Override
	@Transactional
	@CacheEvict(value="transactions", allEntries=true)
	public void deleteTransaction(int id) {
		transactionDAO.deleteTransaction(id);
	}

	@Override
	@Transactional
	public Transaction getTransactionByItemId(int id) {
		return transactionDAO.getTransactionByItemId(id);
	}

	@Override
	@Transactional
	public void deleteTransactions(String name) {
		transactionDAO.deleteTransactions(name);
	}

	@Override
	@CacheEvict(value="transactions",allEntries=true)
	public void refreshAll() {
		
	}

}
