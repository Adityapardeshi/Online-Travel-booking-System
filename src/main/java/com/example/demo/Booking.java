package com.example.demo;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.engine.internal.Cascade;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Booking {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date departure_date;
	int total_people;
	String pkg_name;
	@ManyToOne
	Customer cust;
	
	public int getTotal_people() {
		return total_people;
	}
	public void setTotal_people(int total_people) {
		this.total_people = total_people;
	}
	public Customer getCust() {
		return cust;
	}
	public void setCust(Customer cust) {
		this.cust = cust;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDeparture_date() {
		return departure_date;
	}
	public void setDeparture_date(Date departure_date) {
		this.departure_date = departure_date;
	}
	public String getPkg_name() {
		return pkg_name;
	}
	public void setPkg_name(String pkg_name) {
		this.pkg_name = pkg_name;
	}
	
	
}
