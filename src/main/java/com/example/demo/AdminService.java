package com.example.demo;

import java.util.List;

public interface AdminService {
	void registerAdmin(Admin a);

	Admin checkCreds(String email, String password);
	
	void storePackage(Packages p);
	
	List<Packages> getPackages();
	
}
