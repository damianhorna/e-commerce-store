package com.damianhorna.mvc.service;

import java.util.List;

import com.damianhorna.mvc.entities.Transaction;

public interface TransactionService {

	public List<Transaction> getTransactions(String buyer);

	public void saveTransaction(Transaction transaction);

	public Transaction getTransaction(int id);

	public void deleteTransaction(int id);

	public Transaction getTransactionByItemId(int id);

	public void deleteTransactions(String name);
	
	public void refreshAll();
}
