package com.xaccp.alumniWEB.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_user")
public class User {

	@Id
	@GeneratedValue(generator = "uid")
	@GenericGenerator(name = "uid", strategy = "native")
	private int uid;
	@Column(name = "uname")
	private String uname;// 用户名
	@Column(name = "upwd")
	private String upwd;// 密码
	@Column(name = "aginUpwd")
	private String aginUpwd;// 再次输入密码
	@Column(name = "email")
	private String email;// 邮箱
	@Column(name = "pepolNum")
	private String pepolNum;// 身份证号

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public User() {

	}

	public User(int uid, String uname, String upwd, String aginUpwd, String email, String pepolNum) {
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.aginUpwd = aginUpwd;
		this.email = email;
		this.pepolNum = pepolNum;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + ", aginUpwd=" + aginUpwd + ", email="
				+ email + ", pepolNum=" + pepolNum + "]";
	}
	
	
	

}