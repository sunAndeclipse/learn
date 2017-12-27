package com.xaccp.alumniWEB.dao.impl;
 
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.xaccp.alumniWEB.dao.UserDao;
import com.xaccp.alumniWEB.entity.User;

 
/**
 * 用戶
 *
 */
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
 
    private HibernateTemplate template;
     
    @Autowired
    public UserDaoImpl(SessionFactory sessionFactory) {
         
        template = new HibernateTemplate(sessionFactory);
         
    }
 

	@Override
	public void saveProduct(User user) {
		
	}

	/**
	 * 查询所有用户返回用户集合
	 */
	@Override
	public List<User> findAllUser() {
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) template.find("from User");
		return users;
	}

	/**
	 * 根据用户名和密码返回集合
	 */
	@Override
	public  List<User> findUserByUnameAndUpwd(String userName,String upwd) {
		//编译器忽略指定的警告，不用在编译完成后出现警告信息。
		/*String hql = "from t_user where uname=? ";*/
		@SuppressWarnings("unchecked")
		List<User> user = (List<User>) template.find("from User where uname=? and upwd=?",userName,upwd);
		return user;
	}

	/**
	 * 根据用户名判断用户是否存在
	 */
	@Override
	public List<User> findUserByUname(String userName) {
		@SuppressWarnings("unchecked")
		List<User> user = (List<User>) template.find("from User where uname=?",userName);
		return user;
	}
	
	
	
 
}