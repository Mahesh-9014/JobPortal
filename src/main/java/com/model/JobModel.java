package com.model;

public class JobModel {

	private int jobId;
	private String title;
	private String company;
	private String location;
	private String description;
	private String skills;
	private double salary;
	private String jobType;
	private String username;

	public JobModel() {

	}

	public JobModel(int jobId, String title, String company, String location, String description, String skills,
			double salary, String jobType) {
		this.jobId = jobId;
		this.title = title;
		this.company = company;
		this.location = location;
		this.description = description;
		this.skills = skills;
		this.salary = salary;
		this.jobType = jobType;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
