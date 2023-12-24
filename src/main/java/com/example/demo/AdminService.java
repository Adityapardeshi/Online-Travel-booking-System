package com.example.demo;

public interface AdminService {
	void registerAdmin(Admin a);

	Admin checkCreds(String email, String password);
	
	void storePackage(Packages p);
}
