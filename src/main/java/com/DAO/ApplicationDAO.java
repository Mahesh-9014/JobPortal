package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.ApplicationModel;
import com.utility.DBConnection;

public class ApplicationDAO implements ApplicationDAOInf {

	Connection con = null;

	public boolean applyJob(ApplicationModel am) {
		boolean status = false;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into applications(job_id, username, name, email, phone, resume) values (?, ?, ?, ?, ?, ?)");
			ps.setInt(1, am.getJobId());
			ps.setString(2, am.getUsername());
			ps.setString(3, am.getName());
			ps.setString(4, am.getEmail());
			ps.setString(5, am.getPhone());
			ps.setString(6, am.getResume());

			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public List<ApplicationModel> getApplicationsByUsername(String username) {

		List<ApplicationModel> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from applications where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ApplicationModel am = new ApplicationModel();
				am.setApplicationId(rs.getInt(1));
				am.setJobId(rs.getInt(2));
				am.setName(rs.getString(3));
				am.setEmail(rs.getString(4));
				am.setPhone(rs.getString(5));
				am.setResume(rs.getString(6));
				am.setUsername(rs.getString(7));
				am.setStatus(rs.getString(8));
				list.add(am);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;

	}

	public boolean checkApplication(int jobId, String username) {
		boolean status = false;
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from applications where job_id=? and username=?");
			ps.setInt(1, jobId);
			ps.setString(2, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	@Override
	public List<ApplicationModel> getApplicationsByRecruiter(String username) {
		List<ApplicationModel> list = new ArrayList<>();

		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select a.* from applications a join jobs j on a.job_id = j.job_id where j.username = ?");

			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ApplicationModel am = new ApplicationModel();

				am.setApplicationId(rs.getInt("application_id"));
				am.setJobId(rs.getInt("job_id"));
				am.setUsername(rs.getString("username"));
				am.setName(rs.getString("name"));
				am.setEmail(rs.getString("email"));
				am.setPhone(rs.getString("phone"));
				am.setResume(rs.getString("resume"));
				am.setStatus(rs.getString("status"));
				list.add(am);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	@Override
	public boolean updateApplicationStatus(int applicationId, String status) {

		boolean result = false;

		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update applications set status=? where application_id=?");

			ps.setString(1, status);
			ps.setInt(2, applicationId);

			int n = ps.executeUpdate();
			if (n > 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return result;
	}
}
