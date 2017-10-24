package com.damianhorna.mvc.service;

import java.util.List;

import com.damianhorna.mvc.entities.TransactionArchived;

public interface TransactionArchivedService {

	public List<TransactionArchived> getSold(String seller);
	public List<TransactionArchived> getBought(String buyer);

	public void saveTransaction(TransactionArchived transactionArchived);

	public TransactionArchived getTransaction(int id);

	public void deleteTransaction(int id);
	public TransactionArchived getTransactionByItemId(int id);
}
