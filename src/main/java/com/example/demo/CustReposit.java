package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CustReposit extends JpaRepository<Customer, Integer>
{
	
	Customer findByEmailAndPass(String email,String pass);
	@Query(value = "SELECT * FROM customer WHERE email=?",nativeQuery = true)
	Customer findByEmail(String email);

}
