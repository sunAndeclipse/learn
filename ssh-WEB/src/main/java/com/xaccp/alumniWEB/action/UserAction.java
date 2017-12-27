package com.xaccp.alumniWEB.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.xaccp.alumniWEB.entity.User;
import com.xaccp.alumniWEB.service.UserService;

/**
 * 用户登录-控制层
 *
 */
@Controller
@Scope("prototype")
public class UserAction  {

	HttpSession session = ServletActionContext.getRequest().getSession();
	//验证用户名是否存在返回结果
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	private String userName;
	private String userPwd;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	@Autowired
	private UserService userServiceImpl;

	public UserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}
	/**
	 * 根据用户名判断用户是否存在
	 */
	public String checkUserName() {
		
		if(userServiceImpl.getUserByUsername(userName)!=null) {
			this.result = "ok";
		}else {
			this.result = "no";
		}
		return "success";
		
	}
	
	/**
	 * 根据用户名和密码查询用户
	 * @return
	 */
	public String login() {
		List<User> users = userServiceImpl.findUserByUnameAndUpwd(userName,userPwd);
		System.out.println("用户"+users);
		for (User user1 : users) {
			user = user1;
		}
		if(!users.isEmpty()) {
			session.setAttribute("user",user);
			this.result = "ok";
		}else {
			this.result = "no";
		}
		return "success";
	}
	
	/**
	 * 如果session里面存在user就让他拥有自己的操作
	 * @return
	 */
	public String index() {
		User user2 = (User) session.getAttribute("user");
		if(user2 != null) {
			return "success";
		}
		return "error";
		
	}
	/*
	 * public String saveProduct() { this.addActionMessage("保存成功..."); return
	 * SUCCESS;
	 * 
	 * }
	 */
	

}