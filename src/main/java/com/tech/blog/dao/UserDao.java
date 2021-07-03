package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
//			user__>Database

			String query = "insert into users(user_name,password,email,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
