package com.damianhorna.mvc.entities;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="cart")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Transaction {
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name="id")
	protected int id;
	
	@Column(name="item_id")
	protected int itemId;
	
	@Column(name="buyer")
	protected String buyer;
	
	@Column(name="seller")
	protected String seller;
	
	@Column(name="quantity")
	protected int quantity;
	
	@Column(name="name")
	protected String name;
	
	@Column(name="price")
	protected BigDecimal price;

	public Transaction(){
		
	}

	public Transaction(int item_id, String buyer, String seller, int quantity, String name, BigDecimal price) {
		this.itemId=item_id;
		this.buyer=buyer;
		this.seller=seller;
		this.quantity=quantity;
		this.name=name;
		this.price=price;
	}

	public String getBuyer() {
		return buyer;
	}

	public int getId() {
		return id;
	}

	public int getItemId() {
		return itemId;
	}
	
	public String getName() {
		return name;
	}
	
	public BigDecimal getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}

	public String getSeller() {
		return seller;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", itemId=" + itemId + ", buyer=" + buyer + ", seller=" + seller
				+ ", quantity=" + quantity + ", name=" + name + ", price=" + price + "]";
	}

	
}
