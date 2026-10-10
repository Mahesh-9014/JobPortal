package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.UserModel;
import com.utility.DBConnection;

public class UserDAO implements UserDAOInf {

	boolean status = false;
	Connection con = null;

	@Override
	public boolean registerUser(UserModel um) {

		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into users(username, password, role) values(?,?,?)");
			ps.setString(1, um.getUsername());
			ps.setString(2, um.getPassword());
			ps.setString(3, um.getRole());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public boolean loginUser(String username, String password) {
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public boolean updatePassword(String username, String password) {
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("update users set password=? where username=?");
			ps.setString(1, password);
			ps.setString(2, username);
			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public String getUserRole(String username) {
		String role = "";
		try {
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select role from users where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				role = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return role;
	}

}
