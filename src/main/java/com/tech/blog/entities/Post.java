package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private int catid;
	private int userid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private Timestamp pDate;;
	private String ppic;

	public Post(int pid, int catid, String ptitle, String pcontent, String pcode, Timestamp pDate, String ppic,
			int userid) {
		super();
		this.pid = pid;
		this.userid = userid;
		this.catid = catid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pDate = pDate;
		this.ppic = ppic;
	}

	public Post(String ptitle, String pcontent, String pcode, Timestamp pDate, String ppic, int userid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pDate = pDate;
		this.ppic = ppic;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public String getPpic() {
		return ppic;
	}

	public void setPpic(String ppic) {
		this.ppic = ppic;
	}

}
