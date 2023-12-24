package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class AdminDao implements AdminService {
	
	@Autowired
	AdminRepo repo;
	
	@Autowired
	PackageRepo packRepo;
	
	@Override
	public void registerAdmin(Admin a) {
		
		repo.save(a);
	}

	@Override
	public Admin checkCreds(String email, String password) {
		return repo.findByEmailAndPassword(email, password);
	}

	@Override
	public void storePackage(Packages p) {
		packRepo.save(p);
		
	}

}
