package com.example.demo;

import java.util.List;

public interface CustomerService 
{
	
	void register(Customer c1);

	Customer checkcred(String email,String pass);
	
	List<Customer> getUsers();
	
	void deleteUser(int id);
	
	Customer getSingleCust(int id);
	
	void book(Booking b);
	
	Customer getUserbyEmail(String email);
	
	List<Booking> getBooking(int id);
	
	Booking getSingleBooking(int id);
	void cancelbook(int id);
}
