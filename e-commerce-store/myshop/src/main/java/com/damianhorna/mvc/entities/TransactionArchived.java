package com.damianhorna.mvc.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "archived")
public class TransactionArchived extends Transaction {

	@Column(name = "transaction_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date transactionTime;

	public TransactionArchived() {

	}

	public TransactionArchived(Transaction transaction) {
		this.name = transaction.getName();
		this.itemId = transaction.getItemId();
		this.buyer = transaction.getBuyer();
		this.seller = transaction.getSeller();
		this.quantity = transaction.getQuantity();
		this.name = transaction.getName();
		this.price = transaction.getPrice();
		this.transactionTime = new Date();
	}

	public Date getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}
}
