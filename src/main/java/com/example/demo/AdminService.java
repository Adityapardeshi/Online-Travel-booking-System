package com.example.demo;

import java.util.List;
import java.util.Optional;

public interface AdminService {
	void registerAdmin(Admin a);

	Admin checkCreds(String email, String password);
	
	Packages storePackage(Packages p);
	
	List<Packages> getPackages();
	
	void deletePackages(int id);
	
	Packages getSinglePackage(int id);

}
