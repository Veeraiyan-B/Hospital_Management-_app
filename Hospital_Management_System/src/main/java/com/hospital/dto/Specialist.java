package com.hospital.dto;

public class Specialist {
	
	private int id;
	private String Sname;
	
	
	public Specialist() {
		super();
		
	}


	public Specialist(int id, String sname) {
		super();
		this.id = id;
		Sname = sname;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSname() {
		return Sname;
	}


	public void setSname(String sname) {
		Sname = sname;
	}
	
	


}
