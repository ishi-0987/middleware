package com.woc.dto;

import java.io.Serializable;

public class DriverSearchCriteria implements Serializable{

	private static final long serialVersionUID = -6779314507526973982L;
	
	private String phoneNumber;
	private long driverID;
	
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public long getDriverId() {
		return driverID;
	}
	public void setDriverId(long driverID) {
		this.driverID = driverID;
	}

}
