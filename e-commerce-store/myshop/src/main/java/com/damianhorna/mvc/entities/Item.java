package com.damianhorna.mvc.entities;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "items")
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@NotNull(message = "is required")
	@Size(min = 3, max = 50, message = "provide at least 3 and not more than 50 characters")
	@Column(name = "name")
	private String name;

	@Column(name = "category")
	private String category;

	@Column(name = "owner_username")
	private String ownerUsername;

	@Column(name = "short_description")
	private String shortDescription;

	@Column(name = "long_description")
	private String longDescription;

	@NotNull(message = "provide a proper price")
	@Min(value = 0, message = "cannot be a negative number")
	@Column(name = "price")
	private BigDecimal price;

	@NotNull(message = "provide a proper quantity")
	@Min(value = 0, message = "may not be negative")
	@Column(name = "quantity")
	private int quantity;

	public Item() {

	}

	public String getCategory() {
		return category;
	}

	public int getId() {
		return id;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public String getName() {
		return name;
	}

	public String getOwnerUsername() {
		return ownerUsername;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setOwnerUsername(String ownerUsername) {
		this.ownerUsername = ownerUsername;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", category=" + category + ", ownerUsername=" + ownerUsername
				+ ", shortDescription=" + shortDescription + ", longDescription=" + longDescription + ", price=" + price
				+ ", quantity=" + quantity + "]";
	}

}
