package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDao implements AdminService {
	
	@Autowired
	AdminRepo repo;
	
	@Autowired
	PackageRepo packRepo;
	
	@Autowired
	HotelRepo hotelRepo;
	
	@Autowired
	BookingRepo bookRepo;
	
	@Override
	public void registerAdmin(Admin a) {
		
		repo.save(a);
	}

	@Override
	public Admin checkCreds(String email, String password) {
		return repo.findByEmailAndPassword(email, password);
	}

	@Override
	public Packages storePackage(Packages p) {
		return this.packRepo.save(p);
		
	}

	@Override
	public List<Packages> getPackages() {
		return packRepo.findAll();
	}

	@Override
	public void deletePackages(int id) {
		packRepo.deleteById(id);
		
	}

	@Override
	public Packages getSinglePackage(int id) {
		return packRepo.getById(id);
	}

	@Override
	public void addHotel(Hotel hotel) {
		hotelRepo.save(hotel);
		
	}

	@Override
	public List<Hotel> getHotels() {
		return hotelRepo.findAll();
	}

	@Override
	public void deleteHotel(int id) {
		hotelRepo.deleteById(id);
		
	}

	@Override
	public Hotel getSingleHotel(int id) {
		return hotelRepo.getById(id);
	}

	@Override
	public List<Booking> getBookings() {
		return bookRepo.findAll();
	}


	


}
