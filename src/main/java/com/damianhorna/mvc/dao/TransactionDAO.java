package com.damianhorna.mvc.dao;

import java.util.List;

import com.damianhorna.mvc.entities.Transaction;

public interface TransactionDAO {

	public List<Transaction> getTransactions(String buyer);

	public void saveTransaction(Transaction transaction);

	public Transaction getTransaction(int id);

	public void deleteTransaction(int id);

	public Transaction getTransactionByItemId(int id);

	public void deleteTransactions(String name);
}
