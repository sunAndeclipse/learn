package com.xaccp.alumniWEB.dao;

import java.util.List;

import com.xaccp.alumniWEB.entity.User;

/**
 * 商品操作-持久层接口
 *
 */
public interface UserDao {
 
    void saveProduct(User product);
    /**
     * 查询所有用户信息 
     * @return 返回用户集合
     */
    List<User> findAllUser();
    /**
     * 根据用户名和密码查询用户是否存在
     */
    List<User> findUserByUnameAndUpwd(String userName,String upwd);
    /**
     * 根据用户名判断用户是否存在
     * 
     */
    List<User> findUserByUname(String userName);
}