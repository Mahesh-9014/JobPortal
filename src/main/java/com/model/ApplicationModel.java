package com.model;

public class ApplicationModel {

	private int applicationId;
	private int jobId;
	private String username;
	private String name;
	private String email;
	private String phone;
	private String resume;
	private String status;

	public ApplicationModel() {

	}

	public ApplicationModel(int applicationId, int jobId, String username, String name, String email, String phno,
			String resume, String status) {
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.username = username;
		this.name = name;
		this.email = email;
		this.phone = phno;
		this.resume = resume;
		this.status = status;
	}

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phno) {
		this.phone = phno;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
