package com.DAO;

import java.util.List;

import com.model.JobModel;

public interface JobDAOInf {

	public List<JobModel> getJobDetails();
	
	public List<JobModel> searchJobs(String title, String location);
	
	public JobModel getJobById(int jobId);
	
	public boolean insertJob(JobModel jm);
	
	public List<JobModel> getJobsByUsername(String username);
}
