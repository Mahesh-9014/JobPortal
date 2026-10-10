package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.JobModel;
import com.utility.DBConnection;

public class JobDAO implements JobDAOInf {

	Connection con = null;

	@Override
	public List<JobModel> getJobDetails() {
		List<JobModel> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobs");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				JobModel jm = new JobModel();
				jm.setJobId(rs.getInt(1));
				jm.setTitle(rs.getString(2));
				jm.setCompany(rs.getString(3));
				jm.setLocation(rs.getString(4));
				jm.setDescription(rs.getString(5));
				jm.setSkills(rs.getString(6));
				jm.setSalary(rs.getDouble(7));
				jm.setJobType(rs.getString(8));
				list.add(jm);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<JobModel> searchJobs(String title, String location) {
		List<JobModel> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobs where title like ? and location like ?");
			ps.setString(1, "%" + title + "%");
			ps.setString(2, "%" + location + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				JobModel jm = new JobModel();
				jm.setJobId(rs.getInt(1));
				jm.setTitle(rs.getString(2));
				jm.setCompany(rs.getString(3));
				jm.setLocation(rs.getString(4));
				jm.setDescription(rs.getString(5));
				jm.setSkills(rs.getString(6));
				jm.setSalary(rs.getDouble(7));
				jm.setJobType(rs.getString(8));
				list.add(jm);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;

	}

	public JobModel getJobById(int jobId) {
		JobModel jm = null;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobs where job_id = ?");
			ps.setInt(1, jobId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				jm = new JobModel();
				jm.setJobId(rs.getInt(1));
				jm.setTitle(rs.getString(2));
				jm.setCompany(rs.getString(3));
				jm.setLocation(rs.getString(4));
				jm.setDescription(rs.getString(5));
				jm.setSkills(rs.getString(6));
				jm.setSalary(rs.getDouble(7));
				jm.setJobType(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return jm;
	}

	@Override
	public boolean insertJob(JobModel jm) {
		boolean status = false;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into jobs(title, company, location, description, skills, salary, job_type, username) values (?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, jm.getTitle());
			ps.setString(2, jm.getCompany());
			ps.setString(3, jm.getLocation());
			ps.setString(4, jm.getDescription());
			ps.setString(5, jm.getSkills());
			ps.setDouble(6, jm.getSalary());
			ps.setString(7, jm.getJobType());
			ps.setString(8, jm.getUsername());
			int n = ps.executeUpdate();

			if (n > 0) {
				status = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public List<JobModel> getJobsByUsername(String username) {

		List<JobModel> list = new ArrayList<>();

		try {

			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from jobs where username = ?");
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				JobModel jm = new JobModel();

				jm.setJobId(rs.getInt("job_id"));
				jm.setTitle(rs.getString("title"));
				jm.setCompany(rs.getString("company"));
				jm.setLocation(rs.getString("location"));
				jm.setDescription(rs.getString("description"));
				jm.setSkills(rs.getString("skills"));
				jm.setSalary(rs.getDouble("salary"));
				jm.setJobType(rs.getString("job_type"));
				jm.setUsername(rs.getString("username"));
				list.add(jm);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

}
