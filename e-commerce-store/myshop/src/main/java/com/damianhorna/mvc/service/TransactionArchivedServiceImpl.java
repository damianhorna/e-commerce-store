package com.damianhorna.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damianhorna.mvc.dao.TransactionArchivedDAO;
import com.damianhorna.mvc.entities.TransactionArchived;

@Service
public class TransactionArchivedServiceImpl implements TransactionArchivedService {

	@Autowired
	private TransactionArchivedDAO transactionArchivedDAO;
	
	@Override
	@Transactional
	public List<TransactionArchived> getSold(String seller) {
		return transactionArchivedDAO.getSold(seller);
	}

	@Override
	@Transactional
	public List<TransactionArchived> getBought(String buyer) {
		return transactionArchivedDAO.getBought(buyer);
	}

	@Override
	@Transactional
	public void saveTransaction(TransactionArchived transactionArchived) {
		transactionArchivedDAO.saveTransaction(transactionArchived);
	}

	@Override
	@Transactional
	public TransactionArchived getTransaction(int id) {
		return transactionArchivedDAO.getTransaction(id);
	}

	@Override
	@Transactional
	public void deleteTransaction(int id) {
		transactionArchivedDAO.deleteTransaction(id);
	}

	@Override
	@Transactional
	public TransactionArchived getTransactionByItemId(int id) {
		return transactionArchivedDAO.getTransactionByItemId(id);
	}

}
