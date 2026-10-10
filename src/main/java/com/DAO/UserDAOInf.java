package com.DAO;

import com.model.UserModel;

public interface UserDAOInf {

	public boolean registerUser(UserModel um);
	public boolean loginUser(String username, String password);
	public boolean updatePassword(String username, String password);
	public String getUserRole(String username);
}
