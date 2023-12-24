package com.example.demo;

import java.util.List;

public interface CustomerService 
{
	
	void register(Customer c1);

	Customer checkcred(String email,String pass);
	
	List<Customer> getUsers();
}
