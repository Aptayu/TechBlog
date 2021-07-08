package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

//	Function to get Login
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "select * from users where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				user = new User();
				String name = set.getString("user_name");
				user.setUser_name(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setAbout(set.getString("about"));
				user.setReg_date(set.getTimestamp("reg_date"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "update users set user_name=?, email=?, password=?, about=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			pstmt.setInt(5, user.getId());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
