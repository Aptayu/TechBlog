package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

//get all things from categories table
	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> list = new ArrayList<>();
		try {
//			user__>Database

			String query = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(query);
			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Categories c = new Categories(cid, name, description);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//This will post your post in the database
	public boolean savePost(Post p) {
		boolean f = false;

		try {
			String q = "insert into post(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, p.getPtitle());
			pstmt.setString(2, p.getPcontent());
			pstmt.setString(3, p.getPcode());
			pstmt.setString(4, p.getPpic());
			pstmt.setInt(5, p.getCatid());
			pstmt.setInt(6, p.getUserid());
			pstmt.executeUpdate();

			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
}
