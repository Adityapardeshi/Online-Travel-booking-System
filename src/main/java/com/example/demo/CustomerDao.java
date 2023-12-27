package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CustomerDao implements CustomerService
{
	@Autowired
	CustReposit cr;

	@Override
	public void register(Customer c1)
	{
		cr.save(c1);

	}

	@Override
	public Customer checkcred(String email, String pass)
	{
		
		return cr.findByEmailAndPass(email, pass);
	}

	@Override
	public List<Customer> getUsers() {
		return cr.findAll();
	}

	@Override
	public void deleteUser(int id) {
		cr.deleteById(id);		
	}

	@Override
	public Customer getSingleCust(int id) {
		return cr.getById(id);
	}

}
