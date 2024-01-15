package com.example.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Transient;

@Entity
public class Packages {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	String place;
	int nights;
	int price;
	String activities;
	String hotel;
	@Column(columnDefinition="TEXT")
	String description;
	
	@Column(nullable = true, columnDefinition="TEXT")
	String thumbnail;
	
	@Column(nullable = true, columnDefinition="TEXT")
	String other_image;
	
	@Transient
	public String getthumbnailPath() {
		if(thumbnail == null) return null;
		return "thumbnail/"+id+"/"+thumbnail;
	}
	
	@Transient
	public String getimagesPath() {
		if(other_image == null) return null;
		return "other_image/"+id+"/"+other_image;
	}
	
	public String getOther_image() {
		return other_image;
	}

	public void setOther_image(String other_image) {
		this.other_image = other_image;
	}

	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getNights() {
		return nights;
	}
	public void setNights(int nights) {
		this.nights = nights;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getActivities() {
		return activities;
	}
	public void setActivities(String activities) {
		this.activities = activities;
	}
	public String getHotel() {
		return hotel;
	}
	public void setHotel(String hotel) {
		this.hotel = hotel;
	}
}
