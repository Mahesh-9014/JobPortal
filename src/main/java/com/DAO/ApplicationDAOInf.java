package com.DAO;

import java.util.List;

import com.model.ApplicationModel;

public interface ApplicationDAOInf {

	public boolean applyJob(ApplicationModel am);
	
	public List<ApplicationModel> getApplicationsByUsername(String username);
	
	public boolean checkApplication(int jobId, String username);
	
	public List<ApplicationModel> getApplicationsByRecruiter(String username);
	
	public boolean updateApplicationStatus(int applicationId, String status);
}
