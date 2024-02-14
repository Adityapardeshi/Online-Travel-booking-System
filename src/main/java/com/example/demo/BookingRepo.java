package com.example.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BookingRepo extends JpaRepository<Booking, Integer> {
	@Query(value = "SELECT * FROM booking WHERE cust_id=?",nativeQuery = true)
	List<Booking> getBookingById(int id);
}
