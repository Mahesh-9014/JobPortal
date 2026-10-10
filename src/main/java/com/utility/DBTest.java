package com.utility;

import java.sql.Connection;

public class DBTest {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		
		DBConnection db = new DBConnection();
		Connection conn=db.getConnection();
		System.out.println(conn);

	}

}
