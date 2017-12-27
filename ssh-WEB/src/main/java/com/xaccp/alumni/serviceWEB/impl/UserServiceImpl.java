package com.xaccp.alumni.serviceWEB.impl;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xaccp.alumniWEB.dao.UserDao;
import com.xaccp.alumniWEB.entity.User;
import com.xaccp.alumniWEB.service.UserService;
 
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
 
    @Autowired
    private UserDao userDaoImpl;
     
	@Override
	public void saveProduct(User user) {
		
	}
	
	@Override
	public List<User> findUserByUnameAndUpwd(String userName,String upwd) {
		List<User> users = userDaoImpl.findUserByUnameAndUpwd(userName,upwd);
		return users;
	}

	public User getUserByUsername(String userName) {
		List<User> users = userDaoImpl.findUserByUname(userName);
		for (User user : users) {
			if(user != null) {
				return user;
			}
		}
		return null;
	}
}