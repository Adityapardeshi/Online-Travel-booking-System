package com.example.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PackageRepo extends JpaRepository<Packages, Integer> {
	@Query(value = "SELECT * FROM packages WHERE from_destination=:from and place=:to",nativeQuery = true)
	List<Packages> findByPlaces(String from, String to);
}
